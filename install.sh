#!/bin/bash

set -e

echo "==> Installing dotfiles..."

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Backup existente
if [ -d "$HOME/.config/waybar" ]; then
    echo "==> Backing up existing Waybar config..."
    mv "$HOME/.config/waybar" "$HOME/.config/waybar.backup.$(date +%s)"
fi

# Crear .config si no existe
mkdir -p "$HOME/.config"

# Copiar Waybar
echo "==> Copying Waybar config..."
cp -r "$REPO_DIR/.config/waybar" "$HOME/.config/"

echo "==> Installation complete."
