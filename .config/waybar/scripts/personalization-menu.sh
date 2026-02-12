#!/bin/bash
SCRIPT_DIR="$(dirname "$0")"

choice=$(printf "Waybar\nWaybar Layout\nKitty Theme\nKitty Opacity\nKitty Blur\nBorder Size\nActive Border Color\nInactive Border Color\nInner Gaps\nOuter Gaps\nBack" | rofi -dmenu -p "Personalization")

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
  "Border Size")
    ~/.config/hypr/scripts/border-size-menu.sh
    ;;
  "Active Border Color")
    ~/.config/hypr/scripts/active-border-color-menu.sh
    ;;
  "Inactive Border Color")
    ~/.config/hypr/scripts/inactive-border-color-menu.sh
    ;;
  "Inner Gaps")
    ~/.config/hypr/scripts/gaps-in-menu.sh
    ;;
  "Outer Gaps")
    ~/.config/hypr/scripts/gaps-out-menu.sh
    ;;
  Back)
    "$SCRIPT_DIR/settings-menu.sh"
    ;;
  *)
    exit 0
    ;;
esac
