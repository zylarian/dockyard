# Anything LLM for Dockyard

The all-in-one AI application for everyone to do RAG and more.

## Quick Start

```bash
make service anything-llm start
```

Access the interface at http://localhost:3200

## Configuration

The service uses the official `mintplexlabs/anythingllm` image.

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External port | 3200 |
| STORAGE_DIR | Storage directory | /app/server/storage |
| JWT_SECRET | Security token | generate-a-secure-jwt-secret |
| LLM_PROVIDER | Default provider | ollama |
| OLLAMA_BASE_URL | Ollama connection | http://host.docker.internal:11434 |

## Integration

This service is pre-configured to work with:
- **Ollama**: For local LLM inference (pre-configured)
- **ChromaDB**: Can be configured as vector database (default: lancedb embedded)
- **LocalAI**: Supported provider

## Persistence

Data is persisted in the `anything_llm_storage` volume.
Docs are collected in `anything_llm_collector`.
