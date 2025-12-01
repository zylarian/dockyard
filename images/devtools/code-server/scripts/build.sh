#!/bin/bash
# Multi-architecture build script for Code Server
# Reads version from VERSION file and builds all variants with proper tags

set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION_FILE="${CURRENT_DIR}/VERSION"

# Source VERSION file
source "$VERSION_FILE"

PLATFORMS="linux/amd64"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}🏗️  Multi-Architecture Build for Code Server v${CODE_SERVER_VERSION}${NC}"
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

# Build Debian variant (local architecture only for faster builds)
echo -e "${BLUE}📦 Building Debian variant (${PLATFORMS})...${NC}"
echo -e "${YELLOW}Note: Building for local architecture only. Multi-arch build happens during publish.${NC}"
docker buildx build \
  --platform linux/amd64 \
  --build-arg CODE_SERVER_VERSION=${CODE_SERVER_VERSION} \
  --tag ${IMAGE_NAME}:${CODE_SERVER_VERSION} \
  --tag ${IMAGE_NAME}:${CODE_SERVER_VERSION}-debian \
  --tag ${IMAGE_NAME}:latest \
  --tag ${IMAGE_NAME}:latest-debian \
  --file build/Dockerfile.debian \
  --load \
  ${CURRENT_DIR}

echo -e "${GREEN}✅ Debian variant built${NC}"
echo ""

echo -e "${GREEN}🎉 Build completed!${NC}"
echo ""
echo "Built tags (local architecture):"
echo -e "${BLUE}Debian:${NC}"
echo "  • ${IMAGE_NAME}:${CODE_SERVER_VERSION}"
echo "  • ${IMAGE_NAME}:${CODE_SERVER_VERSION}-debian"
echo "  • ${IMAGE_NAME}:latest"
echo "  • ${IMAGE_NAME}:latest-debian"
echo ""
echo "Local architecture: linux/amd64"
echo "Multi-arch build (${PLATFORMS}) happens during publish."
echo ""
echo "To publish multi-arch images, run: ./scripts/publish.sh"
