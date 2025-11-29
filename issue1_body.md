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
