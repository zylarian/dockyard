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
| TABBY_DEVICE | Device (cuda/cpu) | cpu |

### GPU Support

This service is configured to use CPU by default for maximum compatibility.

**To enable GPU acceleration:**
1. Ensure you have NVIDIA Container Toolkit installed
2. Create a `.env` file from `.env.example`
3. Set `TABBY_DEVICE=cuda`
4. Add the following to `docker-compose.yml` under the `tabby` service:
   ```yaml
   deploy:
     resources:
       reservations:
         devices:
           - driver: nvidia
             count: 1
             capabilities: [gpu]
   ```

## IDE Integration

1. Install the Tabby plugin for VS Code or IntelliJ
2. Set the endpoint to `http://localhost:8100` (or your server IP)
3. Set the authentication token (found in the logs or dashboard)
