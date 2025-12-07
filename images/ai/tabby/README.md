# Tabby for Dockyard

Self-hosted AI coding assistant. An open-source alternative to GitHub Copilot.

## Quick Start

```bash
make service tabby start
```

Access the interface at http://localhost:8100

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External port | 8100 |
| TABBY_MODEL | Model to use | StarCoder-1B |
| TABBY_DEVICE | Device (cuda/cpu) | cuda |

### GPU Support

This service is configured to use NVIDIA GPUs by default.
Supported devices: `cuda`, `rocm`, `cpu`.

If you do NOT have a GPU, update `docker-compose.yml`:
- Remove the `deploy` section
- Set `TABBY_DEVICE=cpu`

## IDE Integration

1. Install the Tabby plugin for VS Code or IntelliJ
2. Set the endpoint to `http://localhost:8100` (or your server IP)
3. Set the authentication token (found in the logs or dashboard)
