#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "🔍 Validating Dockerfiles..."

# Check if hadolint is installed
if ! command -v hadolint &> /dev/null; then
    echo -e "${YELLOW}⚠️  hadolint not found. Install it from: https://github.com/hadolint/hadolint${NC}"
    echo "Skipping Dockerfile linting..."
    exit 0
fi

# Find all Dockerfiles
dockerfiles=$(find images -name "Dockerfile*" -type f)

if [ -z "$dockerfiles" ]; then
    echo -e "${YELLOW}No Dockerfiles found${NC}"
    exit 0
fi

errors=0

for dockerfile in $dockerfiles; do
    echo "Checking: $dockerfile"
    
    if hadolint "$dockerfile"; then
        echo -e "${GREEN}✓ $dockerfile passed${NC}"
    else
        echo -e "${RED}✗ $dockerfile failed${NC}"
        ((errors++))
    fi
done

echo ""
if [ $errors -eq 0 ]; then
    echo -e "${GREEN}✓ All Dockerfiles are valid${NC}"
    exit 0
else
    echo -e "${RED}✗ $errors Dockerfile(s) failed validation${NC}"
    exit 1
fi
