#!/bin/bash
# Quick start script for Portainer

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Starting Portainer with Zylarian Dockyard Templates${NC}"
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Docker is not running${NC}"
    echo "Please start Docker and try again"
    exit 1
fi

# Start Portainer
echo -e "${BLUE}📦 Starting Portainer...${NC}"
cd "$SCRIPT_DIR"
docker compose up -d

echo ""
echo -e "${GREEN}✅ Portainer is running!${NC}"
echo ""

# Configure templates automatically
echo -e "${BLUE}🔧 Configuring templates...${NC}"
if [ -f "$SCRIPT_DIR/scripts/configure-templates.sh" ]; then
    "$SCRIPT_DIR/scripts/configure-templates.sh"
else
    echo -e "${YELLOW}⚠️  Template configuration script not found${NC}"
    echo -e "${YELLOW}Please configure templates manually in Settings > App Templates${NC}"
    echo -e "${YELLOW}URL: http://templates-server/templates.json${NC}"
fi

echo ""
echo -e "${BLUE}Access Portainer at:${NC}"
echo "  • HTTP:  http://localhost:9000"
echo "  • HTTPS: https://localhost:9443"
echo ""
echo -e "${YELLOW}First time setup:${NC}"
echo "  1. Create admin account"
echo "  2. Select 'Docker' environment"
echo "  3. Go to 'App Templates' to see Zylarian templates"
echo ""
echo -e "${BLUE}To stop Portainer:${NC}"
echo "  docker compose down"
echo ""
echo -e "${BLUE}To view logs:${NC}"
echo "  docker compose logs -f portainer"
