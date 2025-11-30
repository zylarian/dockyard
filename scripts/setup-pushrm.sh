#!/bin/bash
# Install docker-pushrm plugin for syncing README to Docker Hub

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🔧 Installing docker-pushrm plugin...${NC}"

# Determine architecture
ARCH=$(uname -m)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')

if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
elif [ "$ARCH" == "aarch64" ] || [ "$ARCH" == "arm64" ]; then
    ARCH="arm64"
else
    echo -e "${RED}Unsupported architecture: $ARCH${NC}"
    exit 1
fi

VERSION="v1.9.0"
URL="https://github.com/christian-korneck/docker-pushrm/releases/download/${VERSION}/docker-pushrm_${OS}_${ARCH}"
PLUGIN_DIR="$HOME/.docker/cli-plugins"
PLUGIN_PATH="$PLUGIN_DIR/docker-pushrm"

echo "Downloading from: $URL"

# Create directory
mkdir -p "$PLUGIN_DIR"

# Download
if curl -L -o "$PLUGIN_PATH" "$URL"; then
    chmod +x "$PLUGIN_PATH"
    echo -e "${GREEN}✅ docker-pushrm installed to ${PLUGIN_PATH}${NC}"
    
    # Verify installation
    if docker pushrm --help > /dev/null 2>&1; then
        echo -e "${GREEN}✅ docker-pushrm is ready to use${NC}"
    else
        echo -e "${YELLOW}⚠️  Verification failed. Is the plugin executable?${NC}"
        echo "Try running: chmod +x ${PLUGIN_PATH}"
    fi
else
    echo -e "${RED}❌ Download failed${NC}"
    exit 1
fi
