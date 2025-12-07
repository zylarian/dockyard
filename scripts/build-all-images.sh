#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🏗️  Building all images...${NC}"
echo ""

# Find all image directories (depth 2: stacks/category/image)
find stacks -mindepth 2 -maxdepth 2 -type d | sort | while read -r image_dir; do
    if [ ! -d "$image_dir" ]; then
        continue
    fi
    
    image_name=$(basename "$image_dir")
    
    # Check for custom build script
    if [ -f "$image_dir/scripts/build.sh" ]; then
        echo -e "${BLUE}Building: $image_name (using custom script)${NC}"
        if (cd "$image_dir" && ./scripts/build.sh); then
            echo -e "${GREEN}✓ Successfully built $image_name${NC}"
        else
            echo -e "${RED}✗ Failed to build $image_name${NC}"
            exit 1
        fi
        echo ""
        continue
    fi

    # Check for standard Dockerfile
    if [ -f "$image_dir/Dockerfile" ]; then
        echo -e "${BLUE}Building: $image_name (standard)${NC}"
        if docker build -t "zylarian/$image_name:local" "$image_dir"; then
            echo -e "${GREEN}✓ Successfully built $image_name${NC}"
        else
            echo -e "${RED}✗ Failed to build $image_name${NC}"
            exit 1
        fi
        echo ""
        continue
    fi
    
    echo -e "${RED}Skipping $image_name: No Dockerfile or build script found${NC}"
done

echo -e "${GREEN}✓ All images built successfully${NC}"
