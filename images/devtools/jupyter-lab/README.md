# Jupyter Lab - Interactive Development Environment

Production-ready Docker image for [Jupyter Lab](https://jupyterlab.readthedocs.io/), a web-based interactive development environment for notebooks, code, and data.

**Version:** 4.3.4 | **Architectures:** amd64, arm64

*Maintained by [Zylarian Innovations LLC](https://github.com/zylarian)*

## 🚀 Quick Start

```bash
# Pull and run
docker run -d \
  -p 8888:8888 \
  --name jupyter-lab \
  zylarian/dockyard-jupyter-lab:latest

# Access at http://localhost:8888
```

## 📦 Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest stable version (recommended) |
| `4.3.4` | Specific version |
| `4.3.4-debian` | Specific version with explicit Debian tag |
| `latest-debian` | Latest with explicit Debian tag |

## ⚙️ Configuration

### Environment Variables

```bash
docker run -d \
  -p 8888:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -e JUPYTER_TOKEN=your-secret-token \
  -v jupyter-notebooks:/home/jupyter/notebooks \
  zylarian/dockyard-jupyter-lab:latest
```

**Common Variables:**
- `JUPYTER_ENABLE_LAB` - Enable Lab interface (default: `yes`)
- `JUPYTER_TOKEN` - Authentication token (default: empty/no password)
- `TZ` - Timezone configuration (default: `UTC`)

### Persistent Data

Mount volumes to persist notebooks and data:

```bash
docker run -d \
  -p 8888:8888 \
  -v jupyter-notebooks:/home/jupyter/notebooks \
  -v jupyter-data:/home/jupyter/data \
  zylarian/dockyard-jupyter-lab:latest
```

## 🔧 Docker Compose

```yaml
version: '3.8'

services:
  jupyter-lab:
    image: zylarian/dockyard-jupyter-lab:latest
    container_name: jupyter-lab
    ports:
      - "8888:8888"
    environment:
      - JUPYTER_ENABLE_LAB=yes
      - JUPYTER_TOKEN=  # Empty = no password
      - TZ=UTC
    volumes:
      - jupyter-notebooks:/home/jupyter/notebooks
      - jupyter-data:/home/jupyter/data
    restart: unless-stopped

volumes:
  jupyter-notebooks:
  jupyter-data:
```

## 📚 Included Packages

This image comes pre-installed with popular data science packages:

**Core:**
- JupyterLab 4.3.4
- IPython
- IPyWidgets

**Data Science:**
- NumPy
- Pandas
- Matplotlib
- Seaborn
- Plotly
- Scikit-learn

**Development:**
- JupyterLab Git extension
- JupyterLab LSP (Language Server Protocol)
- Python LSP Server

## 🏥 Health Check

The image includes a built-in health check:

```bash
# Check container health
docker inspect --format='{{.State.Health.Status}}' jupyter-lab
```

## 🔒 Security

### Default Configuration (Development)

By default, the image runs **without password protection** for easy local development:
- No token required
- No password required

### Production Configuration

For production use, **always set a token**:

```bash
docker run -d \
  -p 8888:8888 \
  -e JUPYTER_TOKEN=your-very-secure-random-token \
  zylarian/dockyard-jupyter-lab:latest
```

Or generate a hashed password:

```bash
# Generate password hash
docker run --rm -it zylarian/dockyard-jupyter-lab:latest \
  python -c "from jupyter_server.auth import passwd; print(passwd('your-password'))"

# Use in environment
docker run -d \
  -p 8888:8888 \
  -e JUPYTER_PASSWORD='argon2:...' \
  zylarian/dockyard-jupyter-lab:latest
```

**Additional Security:**
- Runs as non-root user (`jupyter:jupyter`, UID/GID 1000)
- Minimal base image (Debian slim)
- No unnecessary packages installed
- Regular security updates

## 📊 Resource Requirements

**Minimum:**
- CPU: 1 core
- RAM: 1GB
- Disk: 5GB

**Recommended:**
- CPU: 2+ cores
- RAM: 4GB+
- Disk: 20GB+

## 💡 Usage Examples

### Basic Python Notebook

```python
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Create sample data
data = pd.DataFrame({
    'x': np.arange(100),
    'y': np.random.randn(100).cumsum()
})

# Plot
plt.figure(figsize=(10, 6))
plt.plot(data['x'], data['y'])
plt.title('Random Walk')
plt.show()
```

### Using Git Extension

The JupyterLab Git extension is pre-installed, allowing you to:
- Clone repositories
- Commit changes
- Push/pull from remote
- View diff and history

### Installing Additional Packages

```python
# Install packages from within a notebook
!pip install your-package-name

# Or use conda (if needed)
!pip install package1 package2
```

## 🐛 Troubleshooting

**Container won't start:**
```bash
# Check logs
docker logs jupyter-lab

# Check permissions
docker exec jupyter-lab ls -la /home/jupyter
```

**Port already in use:**
```bash
# Use different port
docker run -d -p 9999:8888 zylarian/dockyard-jupyter-lab:latest
# Access at http://localhost:9999
```

**Out of memory:**
```bash
# Increase memory limit
docker run -d \
  -p 8888:8888 \
  --memory=4g \
  zylarian/dockyard-jupyter-lab:latest
```

**Kernel issues:**
```bash
# Restart the container
docker restart jupyter-lab
```

## 🔄 Updating

```bash
# Pull latest version
docker pull zylarian/dockyard-jupyter-lab:latest

# Stop and remove old container
docker stop jupyter-lab
docker rm jupyter-lab

# Start new container (volumes persist)
docker run -d \
  -p 8888:8888 \
  -v jupyter-notebooks:/home/jupyter/notebooks \
  --name jupyter-lab \
  zylarian/dockyard-jupyter-lab:latest
```

## 📝 License

Jupyter Lab is licensed under the BSD 3-Clause License. This Docker image is provided as-is.

## 🔗 Links

- [JupyterLab Documentation](https://jupyterlab.readthedocs.io/)
- [JupyterLab GitHub](https://github.com/jupyterlab/jupyterlab)
- [Report Issues](https://github.com/zylarian/dockyard/issues)
