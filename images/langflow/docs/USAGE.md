# Langflow - Usage Guide

Detailed instructions for running and configuring Langflow images.

**Current Version:** 1.6.9 (November 2024)

## 📦 Available Variants

| Variant | Tag | Base Image | Size | Use Case |
|---------|-----|------------|------|----------|
| **Debian** | `1.6.9`, `latest` | python:3.12-slim | ~800MB | Full-featured, recommended |
| **Alpine** | `1.6.9-alpine`, `alpine` | python:3.12-alpine | ~400MB | Minimal, production |

## 🎯 About Langflow

Langflow is a visual framework for building multi-agent and RAG applications. It's an open-source UI for LangChain, designed to make it easy to experiment and prototype with LangChain components through a visual interface.

## ✨ Features

- ✅ Based on Python 3.11 slim image
- ✅ Non-root user for security
- ✅ Health check configured
- ✅ Persistent data volume
- ✅ Multi-LLM support (OpenAI, Anthropic, Google, Cohere)
- ✅ SQLite or PostgreSQL database support
- ✅ Resource limits configured

## 🚀 Quick Start

### Pull from Docker Hub

```bash
# Debian variant (recommended, full-featured)
docker pull zylarian/langflow:1.6.9
# or
docker pull zylarian/langflow:latest

# Alpine variant (minimal, smaller size)
docker pull zylarian/langflow:1.6.9-alpine
# or
docker pull zylarian/langflow:alpine
```

### Using Docker (Debian)

```bash
# Run Langflow with Debian variant
docker run -d \
  -p 7860:7860 \
  -v langflow_data:/app/data \
  --name langflow \
  zylarian/langflow:1.6.9
```

### Using Docker (Alpine)

```bash
# Run Langflow with Alpine variant
docker run -d \
  -p 7860:7860 \
  -v langflow_data:/app/data \
  --name langflow \
  zylarian/langflow:1.6.9-alpine
```

### Using Docker Compose

Choose your preferred variant in `docker-compose.yml`:

```yaml
version: '3.8'

services:
  langflow:
    # Option 1: Debian variant (default, recommended)
    image: zylarian/langflow:1.6.9
    
    # Option 2: Alpine variant (smaller)
    # image: zylarian/langflow:1.6.9-alpine
    
    ports:
      - "7860:7860"
    volumes:
      - langflow_data:/app/data
    environment:
      - OPENAI_API_KEY=${OPENAI_API_KEY}

volumes:
  langflow_data:
```

Or use the provided files:

```bash
# Clone or copy the files
cd images/langflow

# Copy environment file
cp .env.example .env

# (Optional) Add your API keys to .env
nano .env

# Start Langflow
docker-compose up -d
```

Access Langflow at: `http://localhost:7860`

## 🏗️ Building Locally

### Quick Build (both variants)

```bash
cd images/langflow
./build.sh
```

### Manual Build

```bash
# Build Debian variant
docker build \
  --build-arg LANGFLOW_VERSION=1.6.9 \
  -t zylarian/langflow:1.6.9 \
  -f Dockerfile \
  .

# Build Alpine variant
docker build \
  --build-arg LANGFLOW_VERSION=1.6.9 \
  -t zylarian/langflow:1.6.9-alpine \
  -f Dockerfile.alpine \
  .
```

## 📋 Environment Variables

### Required

| Variable | Description | Default |
|----------|-------------|---------|
| `LANGFLOW_HOST` | Host to bind to | `0.0.0.0` |
| `LANGFLOW_PORT` | Port to listen on | `7860` |

### Database

| Variable | Description | Default |
|----------|-------------|---------|
| `LANGFLOW_DATABASE_URL` | Database connection URL | `sqlite:///./data/langflow.db` |

**SQLite (default - single instance):**
```bash
LANGFLOW_DATABASE_URL=sqlite:///./data/langflow.db
```

**PostgreSQL (recommended for production):**
```bash
LANGFLOW_DATABASE_URL=postgresql://user:password@postgres:5432/langflow
```

### LLM API Keys (Optional)

| Variable | Description |
|----------|-------------|
| `OPENAI_API_KEY` | OpenAI API key |
| `ANTHROPIC_API_KEY` | Anthropic (Claude) API key |
| `COHERE_API_KEY` | Cohere API key |
| `GOOGLE_API_KEY` | Google (Gemini) API key |

## 📁 Volume Mounts

### Recommended Mounts

```yaml
volumes:
  # Persistent data (flows, database)
  - langflow_data:/app/data
  
  # Logs (optional)
  - ./logs:/app/logs
```

## 🔧 Configuration Examples

### Basic Usage

```yaml
version: '3.8'

services:
  langflow:
    image: zylarian/langflow:latest
    ports:
      - "7860:7860"
    volumes:
      - langflow_data:/app/data
    environment:
      - OPENAI_API_KEY=sk-your-key-here

volumes:
  langflow_data:
```

### With PostgreSQL

```yaml
version: '3.8'

services:
  langflow:
    image: zylarian/langflow:latest
    ports:
      - "7860:7860"
    volumes:
      - langflow_data:/app/data
    environment:
      - LANGFLOW_DATABASE_URL=postgresql://langflow:password@postgres:5432/langflow
      - OPENAI_API_KEY=sk-your-key-here
    depends_on:
      - postgres
  
  postgres:
    image: postgres:16-alpine
    environment:
      - POSTGRES_DB=langflow
      - POSTGRES_USER=langflow
      - POSTGRES_PASSWORD=password
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  langflow_data:
  postgres_data:
```

## 🔐 Security

### Non-root User

Langflow runs as user `langflow` (UID 1000) for better security.

### API Keys

- Store API keys in `.env` file (never commit!)
- Use Docker secrets in production
- Rotate keys regularly

### Network

- Bind to `127.0.0.1` if only local access needed
- Use reverse proxy (Traefik, Nginx) for HTTPS
- Implement authentication if exposing publicly

## 🏥 Health Check

Built-in health check endpoint:

```bash
curl http://localhost:7860/health
```

## 📊 Resource Usage

### Default Limits

- **CPU**: 2 cores max, 0.5 reserved
- **Memory**: 2GB max, 512MB reserved

### Tuning

Adjust in docker-compose.yml:

```yaml
deploy:
  resources:
    limits:
      cpus: '4'
      memory: 4G
```

## 🐛 Troubleshooting

### Container won't start

Check logs:
```bash
docker logs langflow
```

### Permission errors

Ensure data directory is writable:
```bash
chmod -R 755 ./data
```

### Port already in use

Change port in `.env`:
```bash
LANGFLOW_PORT=7861
```

### Database connection errors

**SQLite**: Ensure `/app/data` is writable
**PostgreSQL**: Verify connection string and database exists

### API key not working

1. Check key is correctly set in `.env`
2. Restart container after changes
3. Verify key format (OpenAI starts with `sk-`)

## 💡 Usage Tips

### Creating Flows

1. Access web UI at `http://localhost:7860`
2. Drag and drop LangChain components
3. Connect nodes to create flows
4. Test and iterate visually

### Saving Flows

Flows are automatically saved to the database (SQLite or PostgreSQL).

### Exporting Flows

Export flows as JSON from the UI for backup or sharing.

## 🔗 Use Cases

- **RAG Applications**: Build retrieval-augmented generation systems
- **Multi-Agent Systems**: Create complex agent workflows
- **Chatbots**: Design conversational AI applications
- **Data Processing**: Chain LLMs for data transformation
- **Experimentation**: Test LangChain components visually

## 📚 Resources

- [Langflow Official Docs](https://docs.langflow.org/)
- [Langflow GitHub](https://github.com/logspace-ai/langflow)
- [LangChain Documentation](https://docs.langchain.com/)

## 📄 License

This Docker image configuration is MIT Licensed.
Langflow itself is Apache 2.0 Licensed.

## 🤝 Contributing

Improvements welcome! See [CONTRIBUTING.md](../../docs/CONTRIBUTING.md)

---

**Built with ❤️ by Zylarian Innovations LLC**
