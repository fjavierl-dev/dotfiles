#!/usr/bin/env bash

CSS_FILE="$HOME/.config/waybar/style.css"

choice=$(printf "Transparent\nRed\nGreen\nBlue\nWhite\nYellow\nPurple\nBack" | \
  rofi -dmenu -p "Active Border Color")

[ -z "$choice" ] && exit 0

# Mapeo de colores: CSS + Hyprland
case "$choice" in
  Transparent)
    color_css="transparent"
    color_rgba="rgba(00000000)"
    ;;
  Red)
    color_css="red"
    color_rgba="rgba(ff0000ff)"
    ;;
  Green)
    color_css="green"
    color_rgba="rgba(00ff00ff)"
    ;;
  Blue)
    color_css="blue"
    color_rgba="rgba(0000ffff)"
    ;;
  White)
    color_css="white"
    color_rgba="rgba(ffffffff)"
    ;;
  Yellow)
    color_css="yellow"
    color_rgba="rgba(ffff00ff)"
    ;;
  Purple)
    color_css="purple"
    color_rgba="rgba(aa00ffff)"
    ;;
  Back)
    ~/.config/waybar/scripts/personalization-menu.sh
    exit 0
    ;;
esac

# 1️⃣ Cambiar el borde activo de la ventana
hyprctl keyword general:col.active_border "$color_rgba"

# 2️⃣ Cambiar el borde de la Waybar en style.css
# Reemplaza solo la línea "border: ..." dentro del bloque #waybar
sed -i "/^#waybar[[:space:]]*{/,/}/ s/border:.*;/border: 2px solid $color_css;/" "$CSS_FILE"

# 3️⃣ Reiniciar Waybar para aplicar cambios
pkill waybar
waybar &
