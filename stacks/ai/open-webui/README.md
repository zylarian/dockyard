# Open WebUI

Modern web interface for Ollama - ChatGPT-style UI for local LLMs.

## Quick Start

```bash
# Ensure Ollama is running first
make service ollama start

# Start Open WebUI
make service open-webui start

# Access UI
open http://localhost:3100
```

## Features

- ChatGPT-like interface for Ollama
- Multi-user support with authentication
- Conversation history
- Model management
- RAG (Retrieval Augmented Generation)
- Document upload and chat
- Markdown rendering
- Code syntax highlighting

## Configuration

Copy `.env.example` to `.env`:

```bash
cp .env.example .env
```

### Environment Variables

- `OLLAMA_BASE_URL` - Ollama API URL (default: http://ollama:11434)
- `WEBUI_SECRET_KEY` - Secret key for sessions (change in production!)
- `TZ` - Timezone

## Ports

- **3100** - Web interface

## Volumes

- `open_webui_data` - User data, conversations, uploads
- `./logs` - Application logs

## Usage

### First Time Setup

1. Access http://localhost:3100
2. Create an admin account (first user)
3. Configure Ollama connection (should work automatically)
4. Start chatting!

### Using with Ollama

Open WebUI automatically connects to Ollama. Ensure Ollama is running:

```bash
# Check Ollama status
make service ollama logs

# List available models
docker exec ollama ollama list
```

### Pull Models

You can pull models directly from Open WebUI interface or via Ollama:

```bash
# Pull a model
docker exec ollama ollama pull llama3.2
docker exec ollama ollama pull mistral
docker exec ollama ollama pull codellama
```

### Multi-user Setup

- First user becomes admin
- Admin can create additional users
- Each user has separate conversation history
- Shared access to Ollama models

### RAG & Documents

1. Upload documents (PDF, TXT, MD, etc.)
2. Chat with your documents
3. Automatic embedding and retrieval

## Resource Usage

- **CPU**: 2 cores max, 0.5 reserved
- **Memory**: 2GB max, 512MB reserved

## Network

Open WebUI needs to connect to Ollama. They should be on the same Docker network or use host networking.

### Connecting to Existing Ollama

If Ollama is already running:

```yaml
environment:
  - OLLAMA_BASE_URL=http://ollama:11434
```

Or if Ollama is on host:

```yaml
environment:
  - OLLAMA_BASE_URL=http://host.docker.internal:11434
```

## Troubleshooting

### Can't connect to Ollama

```bash
# Check if Ollama is running
docker ps | grep ollama

# Test Ollama API
curl http://localhost:11434/api/tags

# Check Open WebUI logs
make service open-webui logs
```

### Reset Open WebUI

```bash
# Stop and remove data
make service open-webui down
docker volume rm open-webui_open_webui_data

# Start fresh
make service open-webui start
```

## Security

- Change `WEBUI_SECRET_KEY` in production
- First user becomes admin - secure it!
- Enable authentication always
- Use HTTPS in production

## Updates

```bash
# Pull latest image
docker pull ghcr.io/open-webui/open-webui:main

# Recreate container
make service open-webui restart
```

## Links

- [Official Docs](https://docs.openwebui.com)
- [GitHub](https://github.com/open-webui/open-webui)
