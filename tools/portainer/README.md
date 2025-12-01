# Portainer - Container Management UI

This directory contains a pre-configured Portainer setup with custom templates for all Zylarian Dockyard images and stacks.

## 🚀 Quick Start

```bash
cd tools/portainer
docker-compose up -d
```

Access Portainer at: **http://localhost:9000**

## 📋 What's Included

### Custom Templates

Portainer is pre-configured with templates for:

**Container Templates (Type 1):**
- **Langflow** - Visual AI workflow builder
- **Flowise** - LLM flow builder with drag & drop UI
- **n8n** - Workflow automation tool
- **Code Server** - VS Code in the browser

**Stack Templates (Type 2):**
- **Langflow with PostgreSQL** - Production setup
- **Flowise with PostgreSQL** - Production setup
- **n8n with PostgreSQL** - Production setup

## 🎯 Features

- ✅ Pre-configured custom templates
- ✅ One-click deployment of Zylarian images
- ✅ Environment variable configuration via UI
- ✅ Volume management
- ✅ Multi-architecture support

## 📖 Usage

### First Time Setup

1. **Start Portainer:**
   ```bash
   cd tools/portainer
   docker-compose up -d
   ```

2. **Access Portainer:**
   - Open http://localhost:9000
   - Create admin account on first visit

3. **Select Environment:**
   - Choose "Docker" (local)
   - Click "Connect"

4. **Deploy Templates:**
   - Go to "App Templates" in the left sidebar
   - Browse Zylarian Dockyard templates
   - Click on any template to deploy

### Deploying a Container

1. Navigate to **App Templates**
2. Select a template (e.g., "Langflow")
3. Configure:
   - Container name
   - Environment variables
   - Port mappings (if needed)
4. Click **Deploy the container**

### Deploying a Stack

1. Navigate to **App Templates**
2. Select a stack template (e.g., "Langflow with PostgreSQL")
3. Review the compose file
4. Click **Deploy the stack**

## 🔧 Configuration

### Ports

- **9000** - Portainer HTTP UI
- **9443** - Portainer HTTPS UI
- **8000** - Edge Agent tunnel server

### Volumes

- `portainer_data` - Portainer configuration and data

### Custom Templates

Templates are defined in `templates/templates.json`. To add new templates:

1. Edit `templates/templates.json`
2. Add your template following the Portainer template schema
3. Restart Portainer:
   ```bash
   docker-compose restart
   ```

## 📝 Template Schema

### Container Template (Type 1)

```json
{
  "type": 1,
  "title": "App Name",
  "description": "App description",
  "categories": ["Category1", "Category2"],
  "platform": "linux",
  "logo": "https://example.com/logo.png",
  "image": "zylarian/dockyard-app:latest",
  "name": "app-name",
  "ports": ["8080:8080/tcp"],
  "volumes": [
    {
      "container": "/data",
      "bind": "app_data"
    }
  ],
  "env": [
    {
      "name": "ENV_VAR",
      "label": "Environment Variable",
      "default": "value"
    }
  ]
}
```

### Stack Template (Type 2)

```json
{
  "type": 2,
  "title": "Stack Name",
  "description": "Stack description",
  "categories": ["Category"],
  "platform": "linux",
  "logo": "https://example.com/logo.png",
  "repository": {
    "url": "https://github.com/zylarian/dockyard",
    "stackfile": "path/to/docker-compose.yml"
  }
}
```

## 🔗 Links

- [Portainer Documentation](https://docs.portainer.io/)
- [Portainer Templates](https://docs.portainer.io/user/docker/templates)
- [Zylarian Dockyard](https://github.com/zylarian/dockyard)

## 🛠️ Maintenance

### Update Templates

```bash
# Edit templates
nano templates/templates.json

# Restart Portainer
docker-compose restart
```

### Backup Portainer Data

```bash
docker run --rm \
  -v portainer_data:/data \
  -v $(pwd)/backup:/backup \
  alpine tar czf /backup/portainer-backup-$(date +%Y%m%d).tar.gz -C /data .
```

### Restore Portainer Data

```bash
docker run --rm \
  -v portainer_data:/data \
  -v $(pwd)/backup:/backup \
  alpine tar xzf /backup/portainer-backup-YYYYMMDD.tar.gz -C /data
```

## 🐛 Troubleshooting

**Templates not showing:**
- Check `templates/templates.json` syntax
- Restart Portainer: `docker-compose restart`
- Check logs: `docker-compose logs portainer`

**Cannot connect to Docker:**
- Ensure Docker socket is mounted correctly
- Check permissions on `/var/run/docker.sock`

**Port already in use:**
- Change port in `docker-compose.yml`
- Example: `"9001:9000"` instead of `"9000:9000"`

---

**Built with ❤️ by Zylarian Innovations LLC**
