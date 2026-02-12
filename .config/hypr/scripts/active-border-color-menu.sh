#!/usr/bin/env bash

choice=$(printf "Transparent\nRed\nGreen\nBlue\nWhite\nYellow\nPurple\nBack" | \
  rofi -dmenu -p "Active Border Color")

[ -z "$choice" ] && exit 0

case "$choice" in
  Transparent)
    hyprctl keyword general:col.active_border "rgba(00000000)"
    ;;
  Red)
    hyprctl keyword general:col.active_border "rgba(ff0000ff)"
    ;;
  Green)
    hyprctl keyword general:col.active_border "rgba(00ff00ff)"
    ;;
  Blue)
    hyprctl keyword general:col.active_border "rgba(0000ffff)"
    ;;
  White)
    hyprctl keyword general:col.active_border "rgba(ffffffff)"
    ;;
  Yellow)
    hyprctl keyword general:col.active_border "rgba(ffff00ff)"
    ;;
  Purple)
    hyprctl keyword general:col.active_border "rgba(aa00ffff)"
    ;;
  Back)
    ~/.config/waybar/scripts/personalization-menu.sh
    ;;
esac
