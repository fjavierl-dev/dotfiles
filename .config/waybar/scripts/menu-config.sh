#!/usr/bin/env bash
SCRIPT_DIR="$(dirname "$0")"


option=$(printf "Personalization\nWorkspaces\nWallpaper Selecti>

case "$option" in
  Personalization)
   "$SCRIPT_DIR/personalization-menu.sh"
    ;;
  "Workspaces")
    "$SCRIPT_DIR/menu-workspaces.sh"
    ;;
  "Wallpaper Selection")
    "$SCRIPT_DIR/menu-wallpaper.sh"
    ;;
  "Change Rofi Theme")
    "$SCRIPT_DIR/rofi-theme-selector.sh"
    ;;
"About")
    "$SCRIPT_DIR/menu-about.sh"
    ;;
esac
