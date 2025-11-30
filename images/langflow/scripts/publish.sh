#!/bin/bash
# Publish script for Langflow
# Builds multi-architecture images and pushes to Docker Hub

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

# Build and push Debian variant (multi-arch)
echo -e "${BLUE}📤 Building and pushing Debian variant for ${PLATFORMS}...${NC}"
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

# Sync README to Docker Hub
echo -e "${BLUE}📝 Syncing README to Docker Hub...${NC}"
if docker pushrm ${IMAGE_NAME} -f ${CURRENT_DIR}/README.md --short "Langflow ${LANGFLOW_VERSION} - Production-ready Docker image for LangChain UI"; then
    echo -e "${GREEN}✅ README synced to Docker Hub${NC}"
else
    echo -e "${YELLOW}⚠️  Failed to sync README (not critical)${NC}"
fi

echo ""
echo -e "${GREEN}🎉 All images published successfully!${NC}"
echo ""
echo "Published tags (multi-arch: ${PLATFORMS}):"
echo ""
echo -e "${BLUE}Debian:${NC}"
echo "  • ${IMAGE_NAME}:${LANGFLOW_VERSION}"
echo "  • ${IMAGE_NAME}:${LANGFLOW_VERSION}-debian"
echo "  • ${IMAGE_NAME}:latest"
echo "  • ${IMAGE_NAME}:latest-debian"
echo ""
echo -e "${BLUE}View at: https://hub.docker.com/r/zylarian/dockyard-langflow${NC}"
echo ""
echo -e "${YELLOW}Note: Category and icon must be set manually in Docker Hub web interface${NC}"

