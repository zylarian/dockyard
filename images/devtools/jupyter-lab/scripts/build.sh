#!/bin/bash
# Build script for Jupyter Lab
# Builds images locally for testing

set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION_FILE="${CURRENT_DIR}/VERSION"

# Source VERSION file
source "$VERSION_FILE"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}🔨 Building Jupyter Lab v${JUPYTER_VERSION}${NC}"
echo ""

# Build Debian variant
echo -e "${BLUE}Building Debian variant...${NC}"
docker build \
  --build-arg JUPYTER_VERSION=${JUPYTER_VERSION} \
  --tag ${IMAGE_NAME}:${JUPYTER_VERSION}-local \
  --tag ${IMAGE_NAME}:latest-local \
  --file build/Dockerfile.debian \
  ${CURRENT_DIR}

echo ""
echo -e "${GREEN}✅ Build complete!${NC}"
echo ""
echo "Local tags:"
echo "  • ${IMAGE_NAME}:${JUPYTER_VERSION}-local"
echo "  • ${IMAGE_NAME}:latest-local"
echo ""
echo "Test with:"
echo "  docker run -d -p 8888:8888 ${IMAGE_NAME}:latest-local"
