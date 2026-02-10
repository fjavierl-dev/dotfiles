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

# ==============================
# 1. Install Dependencies
# ==============================

echo "==> Installing required packages..."

sudo pacman -S --needed --noconfirm \
  hyprland \
  waybar \
  rofi-wayland \
  wlogout \
  jq \
  git \
  pipewire \
  pipewire-pulse \
  wireplumber \
  pavucontrol \
  networkmanager \
  network-manager-applet \
  wpa_supplicant \
  grim \
  slurp \
  swww \
  bluez \
  bluez-utils \
  blueman \
  kitty \
  cmatrix \
  gnome-keyring \
  zenity \
  cava \
  wl-clipboard

echo "==> Dependencies installed."
echo

# ==============================
# 2. Backup Existing Configs
# ==============================

mkdir -p "$HOME/.config"

if [ -d "$HOME/.config/waybar" ]; then
    echo "==> Backing up existing Waybar config..."
    mv "$HOME/.config/waybar" "$HOME/.config/waybar.backup.$(date +%Y%m%d-%H%M%S)"
fi

if [ -d "$HOME/.config/hypr" ]; then
    echo "==> Backing up existing Hypr config..."
    mv "$HOME/.config/hypr" "$HOME/.config/hypr.backup.$(date +%Y%m%d-%H%M%S)"
fi

echo

# ==============================
# 3. Copy Configurations
# ==============================

echo "==> Copying Waybar config..."
cp -r "$REPO_DIR/waybar" "$HOME/.config/"

echo "==> Copying Hypr config..."
cp -r "$REPO_DIR/hypr" "$HOME/.config/"

echo

# ==============================
# 4. Enable Services (if needed)
# ==============================

echo "==> Enabling NetworkManager..."
sudo systemctl enable NetworkManager
echo "==> Enabling PipeWire services..."
systemctl --user enable pipewire pipewire-pulse wireplumber
echo "==> Enabling Bluetooth..."
sudo systemctl enable bluetooth
systemctl --user enable swww

echo

echo "==> Installation complete."
echo "==> Reboot or start Hyprland to apply changes."
