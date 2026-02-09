#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Waybar\nBack" | rofi -dmenu -p "Personalization")

case "$choice" in
  Waybar)
    "$SCRIPT_DIR/waybar-menu.sh"
    ;;
  Back)
    "$SCRIPT_DIR/settings-menu.sh"
    ;;
  *)
    exit 0
    ;;
esac
