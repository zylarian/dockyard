#!/bin/bash
# Check for latest Jupyter Lab version

set -e

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}Checking latest Jupyter Lab version...${NC}"
echo ""

# Get current version from VERSION file
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "${CURRENT_DIR}/VERSION"

echo -e "Current version: ${GREEN}${JUPYTER_VERSION}${NC}"

# Get latest version from PyPI
LATEST=$(curl -s https://pypi.org/pypi/jupyterlab/json | grep -o '"version":"[^"]*"' | head -1 | cut -d'"' -f4)

echo -e "Latest version:  ${GREEN}${LATEST}${NC}"
echo ""

if [ "$JUPYTER_VERSION" = "$LATEST" ]; then
    echo -e "${GREEN}✓ You are using the latest version${NC}"
else
    echo -e "${YELLOW}⚠️  A newer version is available: ${LATEST}${NC}"
    echo ""
    echo "To update, modify the VERSION file and rebuild."
fi
