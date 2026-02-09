#!/usr/bin/env bash

WALLDIR="$HOME/.config/hypr/wallpapers"
STATE="$HOME/.config/hypr/current_wallpaper"

mkdir -p "$WALLDIR"
mkdir -p "$(dirname "$STATE")"

CHOICE=$(zenity --file-selection \
  --title="Selecciona un wallpaper" \
  --filename="$WALLDIR/" \
  --file-filter="Imágenes | *.png *.jpg *.jpeg *.webp")

[ -z "$CHOICE" ] && exit 0

# Guardar selección (ruta relativa)
RELATIVE_PATH="${CHOICE#$WALLDIR/}"
echo "$RELATIVE_PATH" > "$STATE"


# Aplicar wallpaper
swww img "$CHOICE" --transition-type any
