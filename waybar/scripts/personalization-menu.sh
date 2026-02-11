#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Waybar\nWaybar Layout\nKitty Theme\nKitty Opacity\nKitty Blur\nBack" | rofi -dmenu -p "Personalization")

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
  "Kitty Opacity")
    "$SCRIPT_DIR/kitty-transparency.sh"
    ;;
  "Kitty Blur")
    "$SCRIPT_DIR/kitty-blur.sh"
    ;;

  Back)
    "$SCRIPT_DIR/settings-menu.sh"
    ;;
  *)
    exit 0
    ;;
esac
