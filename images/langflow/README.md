# Zylarian Dockyard - Langflow

Production-ready Langflow images with multi-architecture support (amd64, arm64, arm/v7).

**Current Version:** 1.6.9 (November 2024)

## 📚 Documentation

Detailed documentation is available in the `docs/` directory:

- **[📖 Usage Guide](./docs/USAGE.md)** - Installation, configuration, and usage instructions.
- **[🏗️ Setup & Build](./docs/SETUP.md)** - How to build the images locally.
- **[🔄 Version Management](./docs/VERSION-MANAGEMENT.md)** - Version control and tagging strategy.

## 🚀 Quick Start

```bash
# Pull Debian variant (recommended)
docker pull zylarian/dockyard-langflow:1.6.9

# Run container
docker run -d -p 7860:7860 zylarian/dockyard-langflow:1.6.9
```

## 📦 Available Tags

| Tag | Variant | Architectures | Description |
|-----|---------|---------------|-------------|
| `1.6.9` | Debian | amd64, arm64, arm/v7 | Specific version |
| `1.6.9-alpine` | Alpine | amd64, arm64, arm/v7 | Specific version (Alpine) |
| `latest` | Debian | amd64, arm64, arm/v7 | Latest version |

See [Usage Guide](./docs/USAGE.md) for full details.
