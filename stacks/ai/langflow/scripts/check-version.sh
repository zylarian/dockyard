#!/bin/bash
# Check for new Langflow version on PyPI and update VERSION file

set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION_FILE="${CURRENT_DIR}/VERSION"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}🔍 Checking for new Langflow version...${NC}"

# Get latest version from PyPI
LATEST_VERSION=$(curl -s https://pypi.org/pypi/langflow/json | grep -oP '"version":"\K[^"]+' | head -1)

if [ -z "$LATEST_VERSION" ]; then
    echo -e "${YELLOW}⚠️  Failed to fetch latest version from PyPI${NC}"
    exit 1
fi

# Read current version from VERSION file
CURRENT_VERSION=$(grep "^LANGFLOW_VERSION=" "$VERSION_FILE" | cut -d'=' -f2)

echo "Current version: $CURRENT_VERSION"
echo "Latest version:  $LATEST_VERSION"
echo ""

if [ "$CURRENT_VERSION" == "$LATEST_VERSION" ]; then
    echo -e "${GREEN}✓ Already at latest version${NC}"
    exit 0
fi

echo -e "${YELLOW}📦 New version available: $LATEST_VERSION${NC}"
echo ""

# Ask for confirmation
read -p "Update to version $LATEST_VERSION? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Update cancelled"
    exit 0
fi

# Update VERSION file
RELEASE_DATE=$(date +%Y-%m-%d)
sed -i "s/^LANGFLOW_VERSION=.*/LANGFLOW_VERSION=$LATEST_VERSION/" "$VERSION_FILE"
sed -i "s/^RELEASE_DATE=.*/RELEASE_DATE=$RELEASE_DATE/" "$VERSION_FILE"

echo -e "${GREEN}✓ VERSION file updated${NC}"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff VERSION"
echo "2. Build new images: ./scripts/build.sh"
echo "3. Test the images"
echo "4. Publish: ./scripts/publish.sh"
echo "5. Commit changes: git add VERSION && git commit -m 'Update Langflow to v${LATEST_VERSION}'"
