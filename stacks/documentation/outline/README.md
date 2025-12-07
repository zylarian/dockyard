# Outline

Modern team wiki and documentation platform - Notion alternative.

## Quick Start

```bash
# Ensure dependencies are running
make service postgresql start
make service redis start

# Start Outline
make service outline start

# Access
open http://localhost:3110
```

## Features

- Rich text editor
- Real-time collaboration
- Document organization
- Full-text search
- File uploads
- Comments and mentions
- API access
- Markdown support

## Configuration

**Important**: Generate secure secret keys!

```bash
# Generate secrets
openssl rand -hex 32  # For SECRET_KEY
openssl rand -hex 32  # For UTILS_SECRET
```

Copy `.env.example` to `.env` and update:

```bash
cp .env.example .env
# Edit .env with generated secrets
```

## First Time Setup

1. Access http://localhost:3110
2. Create admin account
3. Create your first collection
4. Start documenting!

## Ports

- **3110** - Web interface

## Dependencies

- **PostgreSQL** - Database backend
- **Redis** - Caching and jobs

## Storage

Files are stored locally in `/var/lib/outline/data` volume.

## Resource Usage

- CPU: 2 cores max, 0.5 reserved
- Memory: 2GB max, 512MB reserved

## Security

- Change SECRET_KEY and UTILS_SECRET immediately!
- Use strong passwords
- Enable HTTPS in production

## Links

- [Official Docs](https://docs.getoutline.com/)
- [GitHub](https://github.com/outline/outline)
