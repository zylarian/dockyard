# Scripts

Automation and validation scripts for Zylarian Dockyard.

## Available Scripts

### `setup-dev.sh`
Sets up the development environment by installing required tools.

**Usage:**
```bash
./scripts/setup-dev.sh
```

**Installs:**
- hadolint (Dockerfile linter)
- shellcheck (Shell script linter)

---

### `validate-dockerfiles.sh`
Validates all Dockerfiles using hadolint.

**Usage:**
```bash
./scripts/validate-dockerfiles.sh
```

**What it checks:**
- Dockerfile best practices
- Security issues
- Optimization opportunities

---

### `validate-stacks.sh`
Validates stack structure and docker-compose files.

**Usage:**
```bash
./scripts/validate-stacks.sh
```

**What it checks:**
- Required files (docker-compose.yml, .env.example, README.md)
- docker-compose.yml syntax validity
- Configuration completeness

---

### `build-all-images.sh`
Builds all Docker images locally.

**Usage:**
```bash
./scripts/build-all-images.sh
```

**Options:**
- Builds each image in `stacks/` directory
- Tags as `zylarian/IMAGE_NAME:local`

---

## Quick Commands via Makefile

Instead of running scripts directly, use the Makefile:

```bash
make validate          # Run all validations
make build-all-images  # Build all images
make setup             # Setup dev environment
```

See `make help` for all available commands.
