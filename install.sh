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
  fastfetch \ 
  cmatrix \
  gnome-keyring \
  zenity \
  cava \
  wl-clipboard \
  libnotify   # <-- agregado

echo "==> Dependencies installed."
echo

echo "==> Installing yay,  mpvpaper"
echo

if ! command -v yay &>/dev/null; then
    echo "==> Installing yay..."
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd ~
    rm -rf /tmp/yay
fi

echo "==> Installing mpvpaper from AUR..."
yay -S --needed --noconfirm mpvpaper

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
echo "==> Ensuring swww-daemon runs..."
pgrep -x swww-daemon >/dev/null || systemctl --user enable --now swww

echo

# ==============================
# 5. Download Themes
# ==============================

echo "==> Installing Kitty themes..."

mkdir -p "$HOME/.config/kitty"

if [ ! -d "$HOME/.config/kitty/kitty-themes" ]; then
    git clone https://github.com/dexpota/kitty-themes "$HOME/.config/kitty/kitty-themes"
    echo "==> Kitty themes installed."
else
    echo "==> Kitty themes already exist. Skipping."
fi

echo
echo "==> Installing Rofi themes..."

if [ ! -d "$HOME/.config/rofi-themes-collection" ]; then
    git clone https://github.com/lr-tech/rofi-themes-collection.git "$HOME/.config/rofi-themes-collection"
    echo "==> Rofi themes installed."
else
    echo "==> Rofi themes already exist. Skipping."
fi

echo

echo "==> Installation complete."
echo "==> Reboot or start Hyprland to apply changes."
