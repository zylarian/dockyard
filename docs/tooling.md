# Development Tooling

This document describes the development tools and workflows available in Zylarian Dockyard.

## 🚀 Quick Start

### Setup Development Environment

```bash
# Run the setup script
./scripts/setup-dev.sh

# Or manually install tools
# - Docker & Docker Compose
# - hadolint (Dockerfile linter)
# - shellcheck (Shell script linter)
```

### Common Commands

```bash
# Show all available commands
make help

# Validate everything
make validate

# Build a specific image
make build-image IMAGE=nginx

# Test a specific stack
make test-stack STACK=databases/postgresql
```

## 🛠️ Tools Overview

## 🛠️ Tools Overview

### Makefile Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make validate` | Validate all Dockerfiles and stacks |
| `make validate-dockerfiles` | Validate only Dockerfiles |
| `make validate-stacks` | Validate only stacks |
| `make lint` | Run all linters |
| `make build-image IMAGE=<name>` | Build a specific image |
| `make build-all-images` | Build all images |
| `make test-stack STACK=<path>` | Test a specific stack |
| `make clean` | Clean up generated files |
| `make setup` | Install development dependencies |
| `make pre-commit` | Run pre-commit checks |

### Scripts

Located in `scripts/`:

#### `validate-dockerfiles.sh`
Validates all Dockerfiles using hadolint.

```bash
./scripts/validate-dockerfiles.sh
```

#### `validate-stacks.sh`
Validates stack structure and docker-compose files.

```bash
./scripts/validate-stacks.sh
```

#### `build-all-images.sh`
Builds all Docker images locally.

```bash
./scripts/build-all-images.sh
```

#### `setup-dev.sh`
Sets up development environment with required tools.

```bash
./scripts/setup-dev.sh
```

## 📋 Configuration Files

### `.editorconfig`
Ensures consistent code formatting across editors:
- 2 spaces for YAML, Dockerfiles, shell scripts
- LF line endings
- UTF-8 encoding

### `.hadolint.yaml`
Hadolint configuration for Dockerfile linting:
- Warning threshold
- Trusted registries
- Label schema validation

### `renovate.json`
Renovate bot configuration for dependency updates:
- Automatic Docker image updates
- Scheduled weekly updates
- Auto-merge for minor/patch updates

## 🔄 Development Workflow

### Adding a New Image

1. Create directory in `images/`
2. Add Dockerfile, README.md, docker-compose.yml
3. Validate locally:
   ```bash
   make build-image IMAGE=myimage
   make validate-dockerfiles
   ```
4. Commit and push
5. **Manual Step**: Run build and publish scripts if ready to release.

### Adding a New Stack

1. Create directory in `stacks/<category>/`
2. Add docker-compose.yml, .env.example, README.md
3. Validate locally:
   ```bash
   make test-stack STACK=category/mystack
   make validate-stacks
   ```
4. Commit and push
5. **Manual Step**: Ensure stack documentation is up to date.

### Pre-commit Checks

Before committing:

```bash
make pre-commit
```

This runs all validators and linters.

## 🚢 Publishing Images

### Manual Publishing

Images are published manually using the provided scripts.

```bash
# Build locally
docker build -t zylarian/myimage:latest images/myimage/

# Push to registry
docker push zylarian/myimage:latest
```

For multi-arch (recommended):

```bash
# Use the publish script if available
./images/langflow/scripts/publish.sh

# Or manually with buildx
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t zylarian/myimage:latest \
  --push \
  images/myimage/
```



## 🐛 Troubleshooting

### hadolint not found

Install hadolint:
```bash
# macOS
brew install hadolint

# Linux
wget -O /usr/local/bin/hadolint \
  https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64
chmod +x /usr/local/bin/hadolint
```

### shellcheck not found

Install shellcheck:
```bash
# macOS
brew install shellcheck

# Ubuntu/Debian
sudo apt-get install shellcheck
```

### Docker Compose validation fails

Ensure you have Docker Compose v2:
```bash
docker compose version
```

If using v1, upgrade or use `docker-compose` (with hyphen).

## 📚 Additional Resources

- [hadolint documentation](https://github.com/hadolint/hadolint)
- [shellcheck wiki](https://github.com/koalaman/shellcheck/wiki)
- [Docker Buildx](https://docs.docker.com/buildx/working-with-buildx/)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Renovate documentation](https://docs.renovatebot.com/)
