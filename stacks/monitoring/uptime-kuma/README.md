# Uptime Kuma

Beautiful uptime monitoring for all your services.

## Quick Start

```bash
make service uptime-kuma start
open http://localhost:3721
```

## Features

- HTTP/HTTPS monitoring
- TCP monitoring
- Ping monitoring
- DNS monitoring
- Push monitoring
- Status pages
- Notifications (email, Slack, Discord, etc.)
- Multi-language support

## Setup

1. Access http://localhost:3721
2. Create admin account
3. Add monitors for your services
4. Configure notifications
5. Create status pages (optional)

## Monitoring Dockyard Services

Add monitors for:
- PostgreSQL (TCP: localhost:5432)
- Redis (TCP: localhost:6379)
- Ollama (HTTP: http://localhost:11434/api/tags)
- Open WebUI (HTTP: http://localhost:3100)
- Metabase (HTTP: http://localhost:3050)
**Ports**: 3721

## Links

- [GitHub](https://github.com/louislam/uptime-kuma)
