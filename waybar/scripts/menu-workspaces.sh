#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$0")"


option=$(printf "Toggle Workspaces\nSwitch Mode\nBack" | rofi -dmenu -p "Workspaces")

case "$option" in
  "Toggle Workspaces")
    "$SCRIPT_DIR/ws-toggle-visibility.sh"
    ;;
  "Switch Mode")
    ~/.config/waybar/scripts/ws-mode.sh
    ;;
  "Back")
    "$SCRIPT_DIR/settings-menu.sh"
    ;;
esac
