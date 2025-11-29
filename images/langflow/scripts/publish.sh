#!/bin/bash
# Multi-architecture publish script for Langflow
# Reads version from VERSION file and publishes all variants with proper tags

set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION_FILE="${CURRENT_DIR}/VERSION"

# Source VERSION file
source "$VERSION_FILE"

PLATFORMS="${ARCHITECTURES}"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Publishing Langflow v${LANGFLOW_VERSION} to Docker Hub${NC}"
echo ""

# Check if logged in to Docker Hub
if ! docker info | grep -q "Username"; then
    echo -e "${RED}⚠️  Not logged in to Docker Hub${NC}"
    echo "Please run: docker login -u zylarian"
    exit 1
fi

echo -e "${GREEN}✓ Logged in to Docker Hub${NC}"
echo ""

# Ensure builder exists
if ! docker buildx inspect multiarch > /dev/null 2>&1; then
    echo -e "${BLUE}Creating buildx builder...${NC}"
    docker buildx create --name multiarch --use
    docker buildx inspect --bootstrap
else
    docker buildx use multiarch
fi

# Build and push Debian variant
echo -e "${BLUE}📤 Building and pushing Debian variant (multi-arch)...${NC}"
docker buildx build \
  --platform ${PLATFORMS} \
  --build-arg LANGFLOW_VERSION=${LANGFLOW_VERSION} \
  --tag ${IMAGE_NAME}:${LANGFLOW_VERSION} \
  --tag ${IMAGE_NAME}:${LANGFLOW_VERSION}-debian \
  --tag ${IMAGE_NAME}:latest \
  --tag ${IMAGE_NAME}:latest-debian \
  --file build/Dockerfile.debian \
  --push \
  ${CURRENT_DIR}

echo -e "${GREEN}✅ Debian variant pushed${NC}"
echo ""

# Build and push Alpine variant
echo -e "${BLUE}📤 Building and pushing Alpine variant (multi-arch)...${NC}"
docker buildx build \
  --platform ${PLATFORMS} \
  --build-arg LANGFLOW_VERSION=${LANGFLOW_VERSION} \
  --tag ${IMAGE_NAME}:${LANGFLOW_VERSION}-alpine \
  --tag ${IMAGE_NAME}:latest-alpine \
  --file build/Dockerfile.alpine \
  --push \
  ${CURRENT_DIR}

echo -e "${GREEN}✅ Alpine variant pushed${NC}"
echo ""

echo -e "${GREEN}🎉 All images published successfully!${NC}"
echo ""
echo "Published tags (multi-arch: amd64, arm64, arm/v7):"
echo ""
echo -e "${BLUE}Debian:${NC}"
echo "  • ${IMAGE_NAME}:${LANGFLOW_VERSION}"
echo "  • ${IMAGE_NAME}:${LANGFLOW_VERSION}-debian"
echo "  • ${IMAGE_NAME}:latest"
echo "  • ${IMAGE_NAME}:latest-debian"
echo ""
echo -e "${BLUE}Alpine:${NC}"
echo "  • ${IMAGE_NAME}:${LANGFLOW_VERSION}-alpine"
echo "  • ${IMAGE_NAME}:latest-alpine"
echo ""
echo -e "${BLUE}View at: https://hub.docker.com/r/zylarian/dockyard-langflow${NC}"
