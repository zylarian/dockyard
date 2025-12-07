# Grafana for Dockyard

The open observability platform. Visualise logs, metrics, and traces from your applications.

## Quick Start

```bash
make service grafana start
```

Access the interface at http://localhost:3710

Credentials:
- User: `admin`
- Password: `admin` (Change on first login)

## Configuration

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| PORT | External port | 3710 |
| GRAFANA_USER | Admin username | admin |
| GRAFANA_PASSWORD | Admin password | admin |
| GRAFANA_PLUGINS | Plugins to install | grafana-clock-panel,grafana-simple-json-datasource |
