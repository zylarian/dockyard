# Mattermost on Zylarian Dockyard

Mattermost is an open-source, self-hosted Slack alternative for secure team collaboration.

## Features
- **Team Messaging**: Real-time chat, threads, and file sharing.
- **Enterprise-Grade**: Self-hosted for data privacy and compliance.
- **Integrations**: Compatible with hundreds of applications.
- **Voice/Video**: Integration with Jitsi/Zoom/etc.
- **Boards**: Kanban boards for project management.

## Setup
Everything is pre-configured to work with the Zylarian Dockyard ecosystem.

### Prerequisites
- Docker & Docker Compose
- `dockyard` network (created automatically by main Makefile)
- PostgreSQL service running (shared `postgresql` container)

### Usage
Start the service:
```bash
make service mattermost start
```

Access the web interface:
http://localhost:8065

Default credentials:
Create the first account (System Admin) on first launch.

## Configuration
Environment variables in `docker-compose.yml`:
- `MM_SQLSETTINGS_DATASOURCE`: Connection string to PostgreSQL.
- `MM_SERVICESETTINGS_SITEURL`: Public URL of the service.

## Data Storage
Persistent volumes used:
- `mattermost_config`
- `mattermost_data` (User files)
- `mattermost_logs`
- `mattermost_plugins`
- `mattermost_client_plugins`
- `mattermost_bleve_indexes`
