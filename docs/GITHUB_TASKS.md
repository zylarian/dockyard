# GitHub Project Tasks

Here are the two tasks drafted for the Zylarian Dockyard project, summarizing the work accomplished.

---

## Task 1: Create Zylarian Dockyard base repository (monorepo)

**Description:**
Initialize the Zylarian Dockyard monorepo to serve as the central hub for all Docker images and Compose stacks. This task establishes the foundational structure, tooling, and documentation standards for the project.

**Scope:**
- Project directory structure.
- Development tooling and automation (Makefile, scripts).
- Documentation and guidelines.
- Manual workflow setup for build and release.

**Acceptance Criteria:**
- [x] **Directory Structure**: Create `stacks/`, `images/`, `templates/`, and `docs/` directories.
- [x] **Tooling**: Implement `Makefile` with commands for building, testing, and validating.
- [x] **Scripts**: Create utility scripts:
    - `setup-dev.sh`: Install dependencies (Hadolint, etc.).
    - `validate-stacks.sh`: Validate `docker-compose.yml` and stack structure.
    - `build-all-images.sh`: Build all images in the repository.
    - `setup-pushrm.sh`: Install tool for syncing READMEs to Docker Hub.
- [x] **Configuration**: Add `.editorconfig`, `.hadolint.yaml`, and `renovate.json`.
- [x] **Documentation**: Create comprehensive documentation:
    - `README.md`: Project overview.
    - `docs/tooling.md`: Guide to Make commands and scripts.
    - `docs/publishing.md`: Manual publishing workflow.
    - `docs/CONTRIBUTING.md`: Contribution guidelines.
- [x] **Workflow**: Remove CI/CD workflows in favor of a robust manual execution model (`make publish-all`).

---

## Task 2: Add preconfigured Langflow image to Zylarian Dockyard

**Description:**
Develop and integrate a production-ready, multi-architecture Docker image for Langflow. This image should support multiple variants (Debian, Alpine) and include a robust versioning and publishing system.

**Scope:**
- Dockerfile development (Debian & Alpine).
- Multi-architecture build support (amd64, arm64).
- Version management and tagging.
- Documentation and usage guides.

**Acceptance Criteria:**
- [x] **Dockerfiles**:
    - `Dockerfile.debian`: Based on `python:3.12-slim`, optimized for compatibility.
    - `Dockerfile.alpine`: Based on `python:3.12-alpine`, optimized for size.
- [x] **Multi-Architecture**: Support `linux/amd64` and `linux/arm64` using `docker buildx`.
- [x] **Security & Optimization**:
    - Run as non-root user (`langflow`).
    - Configure health checks.
    - Set default environment variables (`LANGFLOW_HOST`, `LANGFLOW_DATABASE_URL`).
- [x] **Versioning System**:
    - Centralized `VERSION` file.
    - `scripts/check-version.sh` to check PyPI for updates.
    - Automated tagging strategy (e.g., `1.6.9`, `1.6.9-alpine`, `latest`).
- [x] **Build & Publish**:
    - `scripts/build.sh`: Script to build all variants/architectures.
    - `scripts/publish.sh`: Script to push images to Docker Hub.
- [x] **Documentation**:
    - `README.md`: Simplified index and quick start.
    - `docs/USAGE.md`: Detailed usage and configuration guide.
    - `docs/SETUP.md`: Build instructions.
    - `docs/VERSION-MANAGEMENT.md`: Versioning strategy.
    - Sync `README.md` to Docker Hub description automatically.
