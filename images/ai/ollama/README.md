# Ollama - Run Large Language Models Locally

Production-ready Docker setup for [Ollama](https://ollama.ai/), the easiest way to run large language models locally.

**Port:** 11434 | **Official Image:** ollama/ollama

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

```bash
# Start Ollama
make service ollama start

# Pull and run a model
docker exec -it ollama ollama run llama3.2

# Access at http://localhost:11434
```

## 📦 Features

- **Simple**: Pull and run models with one command
- **Fast**: Optimized inference engine
- **Private**: Everything runs locally
- **OpenAI Compatible**: Drop-in API replacement
- **GPU Support**: Optional NVIDIA GPU acceleration
- **50+ Models**: Llama, Mistral, Gemma, CodeLlama, and more

## ⚙️ Configuration

### Environment Variables

```bash
docker run -d \
  -p 11434:11434 \
  -e TZ=UTC \
  -v ollama-data:/root/.ollama \
  ollama/ollama:latest
```

**Variables:**
- `TZ` - Timezone configuration (default: `UTC`)

### Persistent Data

Mount a volume to persist models:

```bash
docker run -d \
  -p 11434:11434 \
  -v ollama-data:/root/.ollama \
  ollama/ollama:latest
```

## 🔧 Docker Compose

```yaml
services:
  ollama:
    image: ollama/ollama:latest
    container_name: ollama
    ports:
      - "11434:11434"
    environment:
      - TZ=UTC
    volumes:
      - ollama-data:/root/.ollama
    restart: unless-stopped

volumes:
  ollama-data:
```

## 🤖 Available Models

### Small Models (4GB+ RAM)
- **Llama 3.2** (1B, 3B)
- **Phi-3** (3.8B)
- **Gemma 2** (2B)

### Medium Models (8GB+ RAM)
- **Llama 3.1** (8B)
- **Mistral** (7B)
- **CodeLlama** (7B)

### Large Models (16GB+ RAM)
- **Llama 3.1** (70B)
- **Mixtral** (8x7B)

See all models: https://ollama.ai/library

## 💡 Usage

### Pull a Model

```bash
docker exec -it ollama ollama pull llama3.2
```

### Run a Model (Interactive)

```bash
docker exec -it ollama ollama run llama3.2
```

### List Downloaded Models

```bash
docker exec -it ollama ollama list
```

### Remove a Model

```bash
docker exec -it ollama ollama rm llama3.2
```

## 🔌 API Usage

Ollama provides an OpenAI-compatible API:

```bash
# Generate a response
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.2",
  "prompt": "Why is the sky blue?"
}'

# Chat completion
curl http://localhost:11434/api/chat -d '{
  "model": "llama3.2",
  "messages": [
    {"role": "user", "content": "Hello!"}
  ]
}'
```

### Python Example

```python
import requests

response = requests.post('http://localhost:11434/api/generate', json={
    'model': 'llama3.2',
    'prompt': 'Why is the sky blue?'
})

print(response.json())
```

## 📊 Resource Requirements

**Small Models:**
- CPU: 2 cores
- RAM: 4GB
- Disk: 5GB per model

**Medium Models:**
- CPU: 4+ cores
- RAM: 8GB+
- Disk: 10GB per model

**Large Models:**
- CPU: 8+ cores
- RAM: 16GB+
- GPU: NVIDIA with 8GB+ VRAM (recommended)
- Disk: 50GB per model

## 🎯 GPU Support

For faster inference with NVIDIA GPU:

```yaml
services:
  ollama:
    image: ollama/ollama:latest
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

**Prerequisites:**
- NVIDIA GPU
- NVIDIA drivers
- NVIDIA Container Toolkit

## 🏥 Health Check

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' ollama

# List models
docker exec -it ollama ollama list
```

## 🐛 Troubleshooting

**Container won't start:**
```bash
# Check logs
docker logs ollama
```

**Model download fails:**
- Check internet connection
- Verify disk space
- Try a smaller model first

**Out of memory:**
```bash
# Use smaller quantized models
docker exec -it ollama ollama pull llama3.2:1b

# Or increase memory limit
docker run -d \
  -p 11434:11434 \
  --memory=16g \
  ollama/ollama:latest
```

**Slow inference (CPU mode):**
- Use smaller models (1B-3B parameters)
- Enable GPU support if available
- Reduce context length

## 🔄 Updating

```bash
# Pull latest version
docker pull ollama/ollama:latest

# Restart service
make service ollama restart
```

## 📝 License

Ollama is licensed under the MIT License.

## 🔗 Links

- [Ollama Website](https://ollama.ai/)
- [Ollama GitHub](https://github.com/ollama/ollama)
- [Model Library](https://ollama.ai/library)
- [Ollama Documentation](https://github.com/ollama/ollama/blob/main/docs/)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
