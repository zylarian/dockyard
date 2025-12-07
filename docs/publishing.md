# Publishing to Docker Hub

This guide explains how to publish Zylarian Dockyard images to Docker Hub.

## 🔑 Setup Docker Hub Credentials

### Local Development

```bash
# Login to Docker Hub
docker login -u zylarian
```

## 🚀 Publishing Images (Manual Workflow)

### Manual (Local Build & Push)

```bash
# Build the image
cd stacks/langflow
docker build -t zylarian/langflow:latest .

# Test locally
docker run -d -p 7860:7860 zylarian/langflow:latest

# Login to Docker Hub
docker login -u zylarian

# Push to Docker Hub
docker push zylarian/langflow:latest
```

### Multi-arch Build & Push

```bash
# Create buildx builder (one-time setup)
docker buildx create --name multiarch --use

# Build and push for multiple architectures
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t zylarian/langflow:latest \
  --push \
  stacks/langflow/
```

## 📋 Image Naming Convention

Follow this naming convention:

```
zylarian/<image-name>:<tag>
```

Examples:
- `zylarian/langflow:latest`
- `zylarian/langflow:1.0.0`
- `zylarian/langflow:1.0-alpine`

## 🏷️ Tagging Strategy

Tag appropriately before pushing:

```bash
# Tag with version
docker tag zylarian/langflow:latest zylarian/langflow:1.0.0

# Push specific version
docker push zylarian/langflow:1.0.0

# Push latest
docker push zylarian/langflow:latest
```

## ✅ Verification

### Check Image on Docker Hub

Visit: https://hub.docker.com/r/zylarian/langflow

### Pull and Test

```bash
# Pull the published image
docker pull zylarian/langflow:latest

# Run to verify
docker run -d -p 7860:7860 zylarian/langflow:latest

# Check it's working
curl http://localhost:7860/health
```

## 🔒 Security Best Practices

### Docker Hub Access Token

1. **Create token** at: https://hub.docker.com/settings/security
2. **Use token** instead of password
3. **Limit scope** to push/pull only
4. **Rotate regularly** (every 90 days)

### Image Security

- ✅ Scan images for vulnerabilities
- ✅ Use non-root users
- ✅ Pin base image versions
- ✅ Minimize layers and size
- ✅ Don't include secrets in images

## 📊 Monitoring

### Docker Hub

Check image stats:
- Pull count
- Star count
- Last updated

### GitHub Container Registry

View at: https://github.com/orgs/zylarian/packages

## 🐛 Troubleshooting

### Authentication Failed

```bash
# Re-login with correct credentials
docker logout
docker login -u zylarian
```

### Push Denied

Ensure:
- Correct Docker Hub credentials
- Repository exists (or create first push)
- Sufficient permissions

### Multi-arch Build Fails

```bash
# Reset buildx
docker buildx rm multiarch
docker buildx create --name multiarch --use
docker buildx inspect --bootstrap
```

## 📝 Checklist for New Images

Before publishing a new image:

- [ ] Dockerfile lints without errors (`make validate-dockerfiles`)
- [ ] Image builds successfully
- [ ] Image runs and passes health check
- [ ] README.md is comprehensive
- [ ] .env.example includes all variables
- [ ] docker-compose.yml works correctly
- [ ] Appropriate labels in Dockerfile
- [ ] Non-root user configured
- [ ] Version tags are correct
- [ ] Tested on target architectures

## 🔗 Related Documentation

- [Docker Hub Docs](https://docs.docker.com/docker-hub/)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [Docker Buildx](https://docs.docker.com/buildx/working-with-buildx/)

---

**Maintained by Zylarian Innovations LLC**
