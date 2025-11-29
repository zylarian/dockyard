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
