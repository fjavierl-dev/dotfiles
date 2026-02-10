#!/bin/bash

set -e

# ==============================
#        FR DOTFILES
# ==============================

# Color rojo elegante
echo -e "\e[38;2;170;0;0m"

cat << "EOF"

███████╗██████╗
██╔════╝██╔══██╗
█████╗  ██████╔╝
██╔══╝  ██╔══██╗
██║     ██║  ██║
╚═╝     ╚═╝  ╚═╝

        ── Fjavierl Dotfiles ──

EOF

# Reset color
echo -e "\e[0m"

echo "==> Installing FR Dotfiles..."
echo

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"


# Backup existente
if [ -d "$HOME/.config/waybar" ]; then
    echo "==> Backing up existing Waybar config..."
    mv "$HOME/.config/waybar" "$HOME/.config/waybar.backup.$(date +%Y%m%d-%H%M%S)"
fi

# Crear .config si no existe
mkdir -p "$HOME/.config"

# Copiar Waybar
echo "==> Copying Waybar config..."
cp -r "$REPO_DIR/.config/waybar" "$HOME/.config/"





echo "==> Installation complete."
