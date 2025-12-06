#!/bin/bash
# Build script for Ollama
# Since Ollama uses the official image, this script pulls and tags it locally

set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION_FILE="${CURRENT_DIR}/VERSION"

# Source VERSION file
source "$VERSION_FILE"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}🔨 Building Ollama${NC}"
echo ""

# Pull official Ollama image
echo -e "${BLUE}Pulling official Ollama image (version: ${OLLAMA_VERSION})...${NC}"
docker pull ollama/ollama:${OLLAMA_VERSION}

# Tag it with our local naming convention
echo -e "${BLUE}Tagging as ${IMAGE_NAME}:latest-local...${NC}"
docker tag ollama/ollama:${OLLAMA_VERSION} ${IMAGE_NAME}:latest-local

echo ""
echo -e "${GREEN}✅ Build complete!${NC}"
echo ""
echo "Local tags:"
echo "  • ${IMAGE_NAME}:latest-local"
echo ""
echo "Test with:"
echo "  docker run -d -p 11434:11434 ${IMAGE_NAME}:latest-local"
