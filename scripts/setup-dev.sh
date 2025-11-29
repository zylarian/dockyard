#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔧 Setting up development environment...${NC}"
echo ""

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${BLUE}Detected OS: $MACHINE${NC}"
echo ""

# Install hadolint
echo -e "${BLUE}Installing hadolint...${NC}"
if command -v hadolint &> /dev/null; then
    echo -e "${GREEN}✓ hadolint already installed${NC}"
else
    if [ "$MACHINE" = "Mac" ]; then
        brew install hadolint
    elif [ "$MACHINE" = "Linux" ]; then
        wget -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64
        chmod +x /usr/local/bin/hadolint
    fi
    echo -e "${GREEN}✓ hadolint installed${NC}"
fi

# Install shellcheck
echo -e "${BLUE}Installing shellcheck...${NC}"
if command -v shellcheck &> /dev/null; then
    echo -e "${GREEN}✓ shellcheck already installed${NC}"
else
    if [ "$MACHINE" = "Mac" ]; then
        brew install shellcheck
    elif [ "$MACHINE" = "Linux" ]; then
        sudo apt-get update && sudo apt-get install -y shellcheck
    fi
    echo -e "${GREEN}✓ shellcheck installed${NC}"
fi

# Make scripts executable
echo -e "${BLUE}Making scripts executable...${NC}"
chmod +x scripts/*.sh
echo -e "${GREEN}✓ Scripts are now executable${NC}"

echo ""
echo -e "${GREEN}✓ Development environment setup complete!${NC}"
echo ""
echo "Available commands:"
echo "  make help              - Show all available commands"
echo "  make validate          - Validate all files"
echo "  make build-image       - Build a specific image"
echo "  make test-stack        - Test a specific stack"
