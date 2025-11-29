#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🏗️  Building all images...${NC}"
echo ""

# Find all image directories
for image_dir in images/*; do
    if [ ! -d "$image_dir" ]; then
        continue
    fi
    
    image_name=$(basename "$image_dir")
    
    # Skip if no Dockerfile
    if [ ! -f "$image_dir/Dockerfile" ]; then
        echo -e "${RED}Skipping $image_name: No Dockerfile found${NC}"
        continue
    fi
    
    echo -e "${BLUE}Building: $image_name${NC}"
    
    if docker build -t "zylarian/$image_name:local" "$image_dir"; then
        echo -e "${GREEN}✓ Successfully built $image_name${NC}"
    else
        echo -e "${RED}✗ Failed to build $image_name${NC}"
        exit 1
    fi
    
    echo ""
done

echo -e "${GREEN}✓ All images built successfully${NC}"
