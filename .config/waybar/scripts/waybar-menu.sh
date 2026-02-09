#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Position\nBack" | rofi -dmenu -p "Waybar")

case "$choice" in
  Position)
    "$SCRIPT_DIR/waybar-position.sh"
    ;;
esac
