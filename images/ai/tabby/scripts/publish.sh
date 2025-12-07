#!/bin/bash
set -e

# Configuration
IMAGE_NAME="zylarian/dockyard-tabby"
VERSION=$(cat version.txt)
PLATFORMS="linux/amd64"

# Build and push multi-arch image
echo "Building and pushing $IMAGE_NAME:$VERSION for $PLATFORMS..."
docker buildx build --platform $PLATFORMS \
  -t $IMAGE_NAME:$VERSION \
  -t $IMAGE_NAME:latest \
  --push .
