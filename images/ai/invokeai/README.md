# InvokeAI for Dockyard

Leading creative engine for Stable Diffusion models, empowering professionals, artists, and enthusiasts to generate and create visual media.

## Quick Start

```bash
make service invokeai start
```

Access the interface at http://localhost:9095

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External port | 9095 |
| INVOKEAI_ROOT | Root directory | /invokeai |

### GPU Support

This service involves heavy GPU usage. It is configured to use NVIDIA GPUs by default.
Supported devices: `cuda`, `rocm`, `cpu` (slow).

## Setup

When you first start the container, it may take some time to download default models.
Check logs with `make service invokeai logs` to see progress.
