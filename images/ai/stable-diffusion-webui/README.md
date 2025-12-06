# Stable Diffusion WebUI

AUTOMATIC1111 WebUI for Stable Diffusion - easier interface than ComfyUI.

## Quick Start

```bash
# Build the image
make service stable-diffusion-webui build

# Start service (CPU mode)
make service stable-diffusion-webui start

# Access
open http://localhost:7860
```

## Features

- Text-to-image generation
- Image-to-image
- Inpainting
- Outpainting
- ControlNet support
- LoRA models
- Extensions support
- Multiple models
- CPU mode (default)

## Configuration

Runs in CPU mode by default (no GPU required).

### Download Models

Place Stable Diffusion models in `./models/Stable-diffusion/`

Popular models:
- Stable Diffusion v1.5
- Stable Diffusion v2.1
- SDXL

Download from:
- [Hugging Face](https://huggingface.co/)
- [Civitai](https://civitai.com/)

## Ports

- **7860** - Web interface

## Volumes

- `./models` - Stable Diffusion models (safetensors/ckpt)
- `./outputs` - Generated images
- `./extensions` - WebUI extensions
- `./embeddings` - Textual inversion embeddings
- `./logs` - Application logs

## Usage

### Generate Images

1. Access http://localhost:7860
2. Enter prompt
3. Configure settings (steps, CFG scale, size)
4. Click Generate
5. Images saved to `./outputs`

### Install Extensions

1. Go to Extensions tab
2. Available or Install from URL
3. Apply and restart

## GPU Support

To enable GPU (if available):

1. Edit `docker-compose.yml`:
```yaml
runtime: nvidia
environment:
  - COMMANDLINE_ARGS=--listen --port 7860
```

2. Restart service

## Resource Usage

**CPU Mode**:
- CPU: 4 cores max, 2 reserved
- Memory: 8GB max, 4GB reserved
- Generation time: 1-5 minutes per image

**GPU Mode** (if enabled):
- Significantly faster (seconds)
- Requires NVIDIA GPU + CUDA

## Build

```bash
# Local build
cd images/ai/stable-diffusion-webui
./scripts/build.sh

# Multi-arch publish
./scripts/publish.sh
```

## Troubleshooting

### Slow generation

Normal in CPU mode. Consider:
- Reduce image size
- Reduce sampling steps
- Use smaller models

### Out of memory

- Reduce batch size
- Lower image resolution
- Increase Docker memory limit

## Security

- Not exposed publicly by default
- No authentication - use firewall

## Links

- [GitHub](https://github.com/AUTOMATIC1111/stable-diffusion-webui)
- [Wiki](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki)
