# ChromaDB

Production-ready ChromaDB Vector Database image.

## Features

- Based on official ChromaDB image
- Optimized for production use
- Multi-architecture support (amd64, arm64)

## Usage

```bash
docker run -p 8000:8000 zylarian/dockyard-chromadb:latest
```

## Environment Variables

- `IS_PERSISTENT`: Set to `TRUE` for persistent storage (default in stack).
