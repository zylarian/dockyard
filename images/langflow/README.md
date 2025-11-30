# Langflow - Visual AI Workflow Builder

Production-ready Docker image for [Langflow](https://github.com/logspace-ai/langflow), a visual framework for building multi-agent and RAG applications powered by LangChain.

**Version:** 1.6.9 | **Architectures:** amd64, arm64

## 🚀 Quick Start

```bash
# Pull and run
docker run -d \
  -p 7860:7860 \
  --name langflow \
  zylarian/dockyard-langflow:latest

# Access at http://localhost:7860
```

## 📦 Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version (recommended) |
| `1.6.9` | Specific version |
| `1.6.9-debian` | Specific version with explicit Debian tag |
| `latest-debian` | Latest with explicit Debian tag |

## ⚙️ Configuration

### Environment Variables

```bash
docker run -d \
  -p 7860:7860 \
  -e LANGFLOW_HOST=0.0.0.0 \
  -e LANGFLOW_PORT=7860 \
  -e LANGFLOW_DATABASE_URL=sqlite:////app/data/langflow.db \
  -v langflow-data:/app/data \
  zylarian/dockyard-langflow:latest
```

**Common Variables:**
- `LANGFLOW_HOST` - Host to bind (default: `0.0.0.0`)
- `LANGFLOW_PORT` - Port to listen (default: `7860`)
- `LANGFLOW_DATABASE_URL` - Database connection string
- `OPENAI_API_KEY` - OpenAI API key
- `ANTHROPIC_API_KEY` - Anthropic API key
- `GOOGLE_API_KEY` - Google API key

### Persistent Data

Mount a volume to persist flows and database:

```bash
docker run -d \
  -p 7860:7860 \
  -v langflow-data:/app/data \
  -v langflow-logs:/app/logs \
  zylarian/dockyard-langflow:latest
```

## 🔧 Docker Compose

```yaml
version: '3.8'

services:
  langflow:
    image: zylarian/dockyard-langflow:latest
    container_name: langflow
    ports:
      - "7860:7860"
    environment:
      - LANGFLOW_HOST=0.0.0.0
      - LANGFLOW_PORT=7860
      - LANGFLOW_DATABASE_URL=sqlite:////app/data/langflow.db
    volumes:
      - langflow-data:/app/data
      - langflow-logs:/app/logs
    restart: unless-stopped

volumes:
  langflow-data:
  langflow-logs:
```

## 🏥 Health Check

The image includes a built-in health check:

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' langflow
```

## 🔒 Security

- Runs as non-root user (`langflow:langflow`, UID/GID 1000)
- Minimal base image (Debian slim)
- No unnecessary packages installed

## 📊 Resource Requirements

**Minimum:**
- CPU: 2 cores
- RAM: 4GB
- Disk: 10GB

**Recommended:**
- CPU: 4+ cores
- RAM: 8GB+
- Disk: 20GB+

## 🐛 Troubleshooting

**Container won't start:**
```bash
# Check logs
docker logs langflow

# Check permissions
docker exec langflow ls -la /app/data
```

**Port already in use:**
```bash
# Use different port
docker run -d -p 8080:7860 zylarian/dockyard-langflow:latest
```

## 📝 License

Langflow is licensed under the MIT License. This Docker image is provided as-is.

## 🔗 Links

- [Langflow GitHub](https://github.com/logspace-ai/langflow)
- [Langflow Documentation](https://docs.langflow.org/)
- [Report Issues](https://github.com/zylarian/dockyard/issues)


