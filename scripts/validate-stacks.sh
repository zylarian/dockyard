#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo "🔍 Validating stacks..."

errors=0

# Find all stack directories (2 levels deep: category/stack)
for stack_dir in stacks/*/*; do
    if [ ! -d "$stack_dir" ]; then
        continue
    fi
    
    echo -e "${BLUE}Checking: $stack_dir${NC}"
    
    # Check for required files
    required_files=("docker-compose.yml" ".env.example" "README.md")
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$stack_dir/$file" ]; then
            echo -e "${RED}  ✗ Missing $file${NC}"
            ((errors++))
        else
            echo -e "${GREEN}  ✓ Found $file${NC}"
        fi
    done
    
    # Validate docker-compose.yml
    if [ -f "$stack_dir/docker-compose.yml" ]; then
        # Create temporary .env from .env.example for validation
        if [ -f "$stack_dir/.env.example" ]; then
            cp "$stack_dir/.env.example" "$stack_dir/.env" 2>/dev/null || true
        fi
        
        cd "$stack_dir"
        if docker compose config > /dev/null 2>&1; then
            echo -e "${GREEN}  ✓ docker-compose.yml is valid${NC}"
        else
            echo -e "${RED}  ✗ docker-compose.yml is invalid${NC}"
            ((errors++))
        fi
        cd - > /dev/null
        
        # Clean up temporary .env
        rm -f "$stack_dir/.env"
    fi
    
    echo ""
done

if [ $errors -eq 0 ]; then
    echo -e "${GREEN}✓ All stacks are valid${NC}"
    exit 0
else
    echo -e "${RED}✗ Found $errors error(s)${NC}"
    exit 1
fi
