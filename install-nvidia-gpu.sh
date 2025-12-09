#!/bin/bash
set -e

echo "================================================"
echo "NVIDIA Driver & Container Toolkit Installation"
echo "================================================"
echo ""

# Step 1: Update package list
echo "[1/5] Updating package list..."
sudo apt update

# Step 2: Install NVIDIA drivers
echo ""
echo "[2/5] Installing NVIDIA drivers (this may take several minutes)..."
sudo ubuntu-drivers install

echo ""
echo "✅ NVIDIA drivers installed successfully!"
echo ""
echo "⚠️  IMPORTANT: You MUST REBOOT your system now for the driver to load."
echo ""
read -p "Press Enter to continue with Container Toolkit installation, or Ctrl+C to stop and reboot now..."

# Step 3: Install NVIDIA Container Toolkit
echo ""
echo "[3/5] Adding NVIDIA Container Toolkit repository..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://nvidia.github.io/libnvidia-container/stable/deb/$(dpkg --print-architecture) /" | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "[4/5] Installing NVIDIA Container Toolkit..."
sudo apt update
sudo apt install -y nvidia-container-toolkit

# Step 4: Configure Docker
echo ""
echo "[5/5] Configuring Docker to use NVIDIA runtime..."
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

echo ""
echo "================================================"
echo "✅ Installation Complete!"
echo "================================================"
echo ""
echo "Next steps:"
echo "1. REBOOT your system if you haven't already"
echo "2. After reboot, verify with: nvidia-smi"
echo "3. Test Docker GPU: docker run --rm --gpus all nvidia/cuda:12.0-base nvidia-smi"
echo ""
