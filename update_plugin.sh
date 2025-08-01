#!/bin/bash
# Milesight NX Plugin Updater Script

REPO_DIR="/opt/milesight-nx-plugin-updater"
TARGET_DIR="/usr/lib/milesight-nx"

if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning repository..."
    git clone https://github.com/YOUR-USERNAME/milesight-nx-plugin-updater.git "$REPO_DIR"
else
    echo "Pulling latest updates..."
    cd "$REPO_DIR" && git pull
fi

echo "Copying updated plugin libraries..."
sudo mkdir -p "$TARGET_DIR"
sudo cp -f "$REPO_DIR/libs/"*.so "$TARGET_DIR/"

# Restart NX Witness server if running
if systemctl is-active --quiet networkoptix-mediaserver; then
    echo "Restarting NX Witness service..."
    sudo systemctl restart networkoptix-mediaserver
fi

echo "Milesight NX Plugin updated successfully."
