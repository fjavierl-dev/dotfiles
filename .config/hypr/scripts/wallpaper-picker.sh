#!/usr/bin/env bash

WALLDIR="$HOME/.config/hypr/wallpapers"
STATE="$HOME/.config/hypr/current_wallpaper"
VIDEO_STATE="$HOME/.config/hypr/current_wallpaper_video"

mkdir -p "$WALLDIR"
mkdir -p "$(dirname "$STATE")"

CHOICE=$(zenity --file-selection \
  --title="Selecciona un wallpaper" \
  --filename="$WALLDIR/" \
  --file-filter="Imágenes | *.png *.jpg *.jpeg *.webp")

[ -z "$CHOICE" ] && exit 0

# 🔥 Si había video guardado, eliminarlo
rm -f "$VIDEO_STATE"

# 🔥 Matar mpvpaper si está corriendo
pkill mpvpaper 2>/dev/null

# Guardar selección
RELATIVE_PATH="${CHOICE#$WALLDIR/}"
echo "$RELATIVE_PATH" > "$STATE"

# Aplicar wallpaper
swww img "$CHOICE" --transition-type any
