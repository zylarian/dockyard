# Langflow v1.6.9 - Multi-Architecture Image

## 📁 Directory Structure

```
images/langflow/
├── build/                      # Dockerfiles
│   ├── Dockerfile.debian      # Debian variant
│   └── Dockerfile.alpine      # Alpine variant
├── scripts/                    # Build & publish scripts
│   ├── build.sh              # Multi-arch build
│   └── publish.sh            # Multi-arch publish
├── configs/                    # Configuration files (future)
├── docs/                       # Documentation
│   ├── README.md             # Main documentation
│   └── SETUP.md              # This file
├── docker-compose.yml          # Docker Compose configuration
├── .env.example               # Environment template
└── README.md                  # Quick reference
```

## 🏗️ Multi-Architecture Support

### Supported Platforms

- `linux/amd64` - Intel/AMD 64-bit
- `linux/arm64` - ARM 64-bit (Apple Silicon, AWS Graviton, Raspberry Pi 4+)
- `linux/arm/v7` - ARM 32-bit (Raspberry Pi 3, older ARM devices)

### Image Tags

| Tag | Variant | Architectures |
|-----|---------|---------------|
| `1.6.9`, `latest` | Debian | amd64, arm64, arm/v7 |
| `1.6.9-alpine`, `alpine` | Alpine | amd64, arm64, arm/v7 |

## �� Build Process

### Prerequisites

- Docker 20.10+
- Docker Buildx

### Local Build (Multi-Arch)

```bash
cd images/langflow
./scripts/build.sh
```

This will:
1. Create/use multiarch buildx builder
2. Build Debian variant for all platforms
3. Build Alpine variant for all platforms
4. Tag appropriately

### Publish to Docker Hub

```bash
# Login to Docker Hub
docker login -u zylarian

# Build and publish (multi-arch)
./scripts/publish.sh
```

## 🎯 Image Naming Convention

**Format:** `zylarian/dockyard-{service}`

**Examples:**
- `zylarian/dockyard-langflow:1.6.9`
- `zylarian/dockyard-langflow:1.6.9-alpine`
- `zylarian/dockyard-langflow:latest`

## 📊 Size Comparison

| Variant | amd64 | arm64 | arm/v7 |
|---------|-------|-------|--------|
| Debian | ~800MB | ~780MB | ~750MB |
| Alpine | ~400MB | ~380MB | ~360MB |

## 🔄 Version Updates

To update to a new Langflow version:

1. Update `LANGFLOW_VERSION` in:
   - `build/Dockerfile.debian`
   - `build/Dockerfile.alpine`
   - `scripts/build.sh`
   - `scripts/publish.sh`
   - `README.md`

2. Rebuild:
   ```bash
   ./scripts/build.sh
   ```

3. Test locally:
   ```bash
   docker run -d -p 7860:7860 zylarian/dockyard-langflow:latest
   ```

4. Publish:
   ```bash
   ./scripts/publish.sh
   ```

## 🧪 Testing

### Test on Current Architecture

```bash
docker run --rm zylarian/dockyard-langflow:1.6.9 langflow --version
```

### Test Specific Architecture

```bash
# Force amd64
docker run --rm --platform linux/amd64 zylarian/dockyard-langflow:1.6.9 langflow --version

# Force arm64
docker run --rm --platform linux/arm64 zylarian/dockyard-langflow:1.6.9 langflow --version
```

## 📝 Notes

- Multi-arch builds are slower due to emulation
- ARM builds may take 2-3x longer than native amd64
- Use `--load` for local testing, `--push` for publishing
- Buildx cache helps speed up subsequent builds

## 🔗 Resources

- [Docker Buildx Documentation](https://docs.docker.com/buildx/)
- [Multi-platform Images](https://docs.docker.com/build/building/multi-platform/)
- [Langflow Documentation](https://docs.langflow.org/)
