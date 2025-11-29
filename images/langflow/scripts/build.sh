#!/bin/bash
# Multi-architecture build script for Langflow
# Reads version from VERSION file and builds all variants with proper tags

set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION_FILE="${CURRENT_DIR}/VERSION"

# Source VERSION file
source "$VERSION_FILE"

PLATFORMS="linux/amd64,linux/arm64"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}🏗️  Multi-Architecture Build for Langflow v${LANGFLOW_VERSION}${NC}"
echo ""
echo "Platforms: ${PLATFORMS}"
echo "Variants: ${VARIANTS}"
echo ""

# Check if buildx is available
if ! docker buildx version > /dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  docker buildx not found${NC}"
    echo "Please install Docker Buildx"
    exit 1
fi

# Create/use multiarch builder
if ! docker buildx inspect multiarch > /dev/null 2>&1; then
    echo -e "${BLUE}Creating buildx builder...${NC}"
    docker buildx create --name multiarch --use
    docker buildx inspect --bootstrap
else
    echo -e "${BLUE}Using existing multiarch builder${NC}"
    docker buildx use multiarch
fi

echo ""

# Build Debian variant
echo -e "${BLUE}📦 Building Debian variant (multi-arch)...${NC}"
docker buildx build \
  --platform ${PLATFORMS} \
  --build-arg LANGFLOW_VERSION=${LANGFLOW_VERSION} \
  --tag ${IMAGE_NAME}:${LANGFLOW_VERSION} \
  --tag ${IMAGE_NAME}:${LANGFLOW_VERSION}-debian \
  --tag ${IMAGE_NAME}:latest \
  --tag ${IMAGE_NAME}:latest-debian \
  --file build/Dockerfile.debian \
  --load \
  ${CURRENT_DIR}

echo -e "${GREEN}✅ Debian variant built${NC}"
echo ""

# Build Alpine variant
echo -e "${BLUE}🏔️  Building Alpine variant (multi-arch)...${NC}"
docker buildx build \
  --platform ${PLATFORMS} \
  --build-arg LANGFLOW_VERSION=${LANGFLOW_VERSION} \
  --tag ${IMAGE_NAME}:${LANGFLOW_VERSION}-alpine \
  --tag ${IMAGE_NAME}:latest-alpine \
  --file build/Dockerfile.alpine \
  --load \
  ${CURRENT_DIR}

echo -e "${GREEN}✅ Alpine variant built${NC}"
echo ""

echo -e "${GREEN}🎉 All variants built successfully!${NC}"
echo ""
echo "Built tags:"
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
echo "Architectures: amd64, arm64, arm/v7"
echo ""
echo "To publish, run: ./scripts/publish.sh"
