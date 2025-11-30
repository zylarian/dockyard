# Version Management System

## 📋 Overview

Zylarian Dockyard uses a centralized version management system to track and update image versions automatically.

## 📁 Files

- **`VERSION`** - Central version configuration file
- **`scripts/check-version.sh`** - Auto-check for new versions from PyPI
- **`scripts/build.sh`** - Build images using VERSION file
- **`scripts/publish.sh`** - Publish images using VERSION file

## 🏷️ Tagging Strategy

Each image version creates multiple tags to support different use cases:

### Debian Variant

| Tag | Description | Example |
|-----|-------------|---------|
| `{VERSION}` | Specific version, Debian | `1.6.9` |
| `{VERSION}-debian` | Specific version, Debian explicit | `1.6.9-debian` |
| `latest` | Latest version, Debian | `latest` |
| `latest-debian` | Latest version, Debian explicit | `latest-debian` |

### Architecture Support

All tags are **multi-architecture manifests** supporting:
- `linux/amd64` (x86-64)
- `linux/arm64` (ARM 64-bit)

Docker automatically pulls the correct architecture for your system.

## 🔄 Workflow

### 1. Check for New Version

```bash
cd images/langflow
./scripts/check-version.sh
```

This script:
- Queries PyPI for latest Langflow version
- Compares with current VERSION file
- Prompts to update if new version available
- Updates VERSION file automatically

### 2. Build New Version

```bash
./scripts/build.sh
```

Builds:
- Debian variant with tags: `{VERSION}`, `{VERSION}-debian`, `latest`, `latest-debian`
- All multi-arch (amd64, arm64)

### 3. Test Locally

```bash
# Test Debian
docker run --rm zylarian/dockyard-langflow:latest langflow --version

# Test specific architecture
docker run --rm --platform linux/arm64 zylarian/dockyard-langflow:latest langflow --version
```

### 4. Publish to Docker Hub

```bash
./scripts/publish.sh
```

Pushes all tags to Docker Hub with multi-arch support.

### 5. Commit Version Change

```bash
git add VERSION
git commit -m "Update Langflow to v1.6.10"
git push
```

## 📊 Tag Examples

After building version `1.6.9`, these tags exist:

```
zylarian/dockyard-langflow:1.6.9              <- Debian, multi-arch
zylarian/dockyard-langflow:1.6.9-debian       <- Debian, multi-arch
zylarian/dockyard-langflow:latest             <- Latest Debian, multi-arch
zylarian/dockyard-langflow:latest-debian      <- Latest Debian, multi-arch
```

## 🎯 Usage Recommendations

### Production (Pinned Version)

```yaml
services:
  langflow:
    image: zylarian/dockyard-langflow:1.6.9
```

### Production (Auto-updates)

```yaml
services:
  langflow:
    image: zylarian/dockyard-langflow:latest
```

## 🤖 Automation

### GitHub Actions (Future)

```yaml
name: Check Langflow Version

on:
  schedule:
    - cron: '0 0 * * *'  # Daily
  workflow_dispatch:

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check version
        run: |
          cd images/langflow
          ./scripts/check-version.sh
      - name: Create PR if update available
        # Create PR with VERSION update
```

## 🔍 Verification

### Check All Tags

```bash
docker buildx imagetools inspect zylarian/dockyard-langflow:1.6.9
```

Shows all architectures and variants.

### Check Specific Architecture

```bash
docker manifest inspect zylarian/dockyard-langflow:1.6.9 | grep architecture
```

## 📝 Manual Version Update

If you need to manually update:

1. Edit `VERSION` file
2. Update `LANGFLOW_VERSION=x.y.z`
3. Run `./scripts/build.sh`
4. Test
5. Run `./scripts/publish.sh`
6. Commit VERSION file

## 🐛 Troubleshooting

### Version Check Fails

```bash
# Manually check PyPI
curl -s https://pypi.org/pypi/langflow/json | grep version
```

### Build Fails

```bash
# Check VERSION file is valid
cat VERSION
source VERSION
echo $LANGFLOW_VERSION
```

### Wrong Architecture Pulled

```bash
# Force specific architecture
docker pull --platform linux/amd64 zylarian/dockyard-langflow:1.6.9
```

---

**Maintained by Zylarian Innovations LLC**
