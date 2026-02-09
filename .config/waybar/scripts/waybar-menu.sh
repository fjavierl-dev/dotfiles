#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Position\nOpacity\nBack" | rofi -dmenu -p "Waybar")

case "$choice" in
  Position)
    "$SCRIPT_DIR/waybar-position.sh"
    ;;
  Opacity)
    "$SCRIPT_DIR/waybar-transparency.sh"
    ;;
esac
