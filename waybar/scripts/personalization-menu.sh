#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Waybar\nWaybar Layout\nKitty Theme\nKitty Transparency\nBack" | rofi -dmenu -p "Personalization")

case "$choice" in
  Waybar)
    "$SCRIPT_DIR/waybar-menu.sh"
    ;;
  "Waybar Layout")
    "$SCRIPT_DIR/waybar-layout.sh"
    ;;
  "Kitty Theme")
    "$SCRIPT_DIR/kitty-theme.sh"
    ;;
  "Kitty Transparency")
    "$SCRIPT_DIR/kitty-transparency.sh"
    ;;
  Back)
    "$SCRIPT_DIR/settings-menu.sh"
    ;;
  *)
    exit 0
    ;;
esac
