# ComfyUI - Node-Based Stable Diffusion UI

Production-ready Docker image for [ComfyUI](https://github.com/comfyanonymous/ComfyUI), a powerful and modular Stable Diffusion GUI with a graph/nodes interface.

**Port:** 8188 | **Architecture:** amd64

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

```bash
# Using docker-compose (recommended)
cd images/ai/comfyui
docker compose up -d

# Access at http://localhost:8188
```

## 📦 Features

- **Node-Based Interface**: Visual workflow editor for complex AI pipelines
- **Powerful**: Generate images with Stable Diffusion, SDXL, and more
- **Extensible**: Support for custom nodes and extensions
- **Efficient**: Optimized for performance and memory usage
- **GPU Support**: Optional NVIDIA GPU acceleration
- **Model Management**: Organize checkpoints, LoRAs, VAEs, and more

## ⚙️ Configuration

### Environment Variables

```bash
docker run -d \
  -p 8188:8188 \
  -e TZ=UTC \
  -v comfyui-models:/app/ComfyUI/models \
  zylarian/dockyard-comfyui:latest
```

**Variables:**
- `TZ` - Timezone configuration (default: `UTC`)
- `COMFYUI_PORT` - Port to listen on (default: `8188`)

### Persistent Data

Mount volumes for persistent storage:

```bash
docker run -d \
  -p 8188:8188 \
  -v comfyui-models:/app/ComfyUI/models \
  -v comfyui-output:/app/ComfyUI/output \
  -v comfyui-input:/app/ComfyUI/input \
  -v comfyui-custom-nodes:/app/ComfyUI/custom_nodes \
  zylarian/dockyard-comfyui:latest
```

## 🔧 Docker Compose

```yaml
services:
  comfyui:
    image: zylarian/dockyard-comfyui:latest
    container_name: comfyui
    ports:
      - "8188:8188"
    environment:
      - TZ=UTC
    volumes:
      - comfyui-models:/app/ComfyUI/models
      - comfyui-output:/app/ComfyUI/output
      - comfyui-input:/app/ComfyUI/input
      - comfyui-custom-nodes:/app/ComfyUI/custom_nodes
    restart: unless-stopped

volumes:
  comfyui-models:
  comfyui-output:
  comfyui-input:
  comfyui-custom-nodes:
```

## 🎨 Usage

### Download Models

ComfyUI requires Stable Diffusion models to function. Download models and place them in the appropriate directories:

**Checkpoints** (models/checkpoints/):
- [Stable Diffusion 1.5](https://huggingface.co/runwayml/stable-diffusion-v1-5)
- [SDXL](https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0)
- [Realistic Vision](https://civitai.com/models/4201/realistic-vision-v20)

**VAE** (models/vae/):
- [SD 1.5 VAE](https://huggingface.co/stabilityai/sd-vae-ft-mse-original)

**LoRAs** (models/loras/):
- Browse [Civitai](https://civitai.com/) for LoRAs

### Example: Copy model to volume

```bash
# Find volume location
docker volume inspect comfyui_comfyui_models

# Copy model (replace with actual path)
docker cp your-model.safetensors comfyui:/app/ComfyUI/models/checkpoints/
```

### Create Your First Workflow

1. Access ComfyUI at `http://localhost:8188`
2. Load a default workflow from the menu
3. Configure your model and prompts
4. Click "Queue Prompt" to generate

## 🖥️ GPU Support

For NVIDIA GPU acceleration:

1. Install [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

2. Update docker-compose.yml:

```yaml
services:
  comfyui:
    image: zylarian/dockyard-comfyui:latest
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

## 📊 Resource Requirements

**Minimum (CPU only):**
- CPU: 4 cores
- RAM: 8GB
- Disk: 20GB

**Recommended (with GPU):**
- CPU: 6+ cores
- RAM: 16GB+
- GPU: NVIDIA with 6GB+ VRAM
- Disk: 50GB+

**Optimal:**
- CPU: 8+ cores
- RAM: 32GB+
- GPU: NVIDIA RTX with 12GB+ VRAM
- Disk: 100GB+ (for multiple models)

## 🔌 Custom Nodes

Install custom nodes to extend functionality:

```bash
# Access container
docker exec -it comfyui bash

# Navigate to custom nodes
cd /app/ComfyUI/custom_nodes

# Clone custom node
git clone https://github.com/ltdrdata/ComfyUI-Manager

# Restart container
docker restart comfyui
```

Popular custom nodes:
- **ComfyUI-Manager**: Node management UI
- **ControlNet**: Additional control over generation
- **AnimateDiff**: Animation generation

## 🏥 Health Check

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' comfyui
```

## 🐛 Troubleshooting

**Container won't start:**
```bash
# Check logs
docker logs comfyui

# Check disk space
df -h
```

**No models available:**
- Ensure models are in the correct directories
- Check file permissions
- Verify volume mounts

**Out of memory:**
```bash
# Increase memory limit
docker run -d \
  -p 8188:8188 \
  --memory=16g \
  zylarian/dockyard-comfyui:latest
```

**Slow generation (CPU mode):**
- Use smaller models (SD 1.5 instead of SDXL)
- Reduce image resolution
- Consider adding GPU support

**GPU not detected:**
```bash
# Verify NVIDIA runtime
docker run --rm --gpus all nvidia/cuda:11.8.0-base-ubuntu22.04 nvidia-smi

# Check Docker daemon configuration
cat /etc/docker/daemon.json
```

## 🔄 Updating

```bash
# Pull latest version
docker pull zylarian/dockyard-comfyui:latest

# Restart with docker-compose
docker compose down
docker compose up -d
```

## 📝 License

ComfyUI is licensed under the GPL-3.0 License.

## 🔗 Links

- [ComfyUI GitHub](https://github.com/comfyanonymous/ComfyUI)
- [ComfyUI Examples](https://comfyanonymous.github.io/ComfyUI_examples/)
- [Model Downloads - Hugging Face](https://huggingface.co/models)
- [Model Downloads - Civitai](https://civitai.com/)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
