#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Position\nSize\nWaybar Margin\nOpacity\nBack" | rofi -dmenu -p "Waybar")

case "$choice" in
  Position)
    "$SCRIPT_DIR/waybar-position.sh"
    ;;
  Size)
    "$SCRIPT_DIR/waybar-height.sh"
    ;;
"Waybar Margin")
    ~/.config/waybar/scripts/waybar-margin.sh
    ;;
  Opacity)
    "$SCRIPT_DIR/waybar-transparency.sh"
    ;;
  Back)
    "$SCRIPT_DIR/personalization-menu.sh"
    ;;
  *)
    exit 0
    ;;
esac
