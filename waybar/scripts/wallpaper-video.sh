#!/usr/bin/env bash

MONITOR=$(hyprctl monitors | grep "Monitor" | awk '{print $2}' | head -n1)

VIDDIR="$HOME/Vídeos"
STATE="$HOME/.config/hypr/current_wallpaper_video"

mkdir -p "$(dirname "$STATE")"

VIDEO=$(zenity --file-selection \
  --title="Selecciona un wallpaper animado" \
  --filename="$VIDDIR/" \
  --file-filter="Videos | *.mp4 *.mkv *.webm")

[ -z "$VIDEO" ] && exit 0

# Guardar selección
echo "$VIDEO" > "$STATE"

# Matar instancia previa
pkill mpvpaper 2>/dev/null

# Lanzar mpvpaper
mpvpaper "$MONITOR" "$VIDEO" --loop=inf --no-audio --no-osd-bar &
