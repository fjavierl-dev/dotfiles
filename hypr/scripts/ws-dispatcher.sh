#!/usr/bin/env bash

STATE="$HOME/.config/waybar/state/ws_mode"
DIR="$1"

# workspace actual
CUR=$(hyprctl activeworkspace -j | jq '.id')

# fallback
[ -z "$CUR" ] && exit 0

if [ "$(cat "$STATE")" = "linear" ]; then
  case "$DIR" in
    left)  hyprctl dispatch workspace e-1 ;;
    right) hyprctl dispatch workspace e+1 ;;
    up)    hyprctl dispatch workspace e-1 ;;
    down)  hyprctl dispatch workspace e+1 ;;
  esac
  exit 0
fi

# ===== GRID 2x2 =====
# 1 2
# 3 4

case "$CUR:$DIR" in
  1:right) hyprctl dispatch workspace 2 ;;
  1:down)  hyprctl dispatch workspace 3 ;;

  2:left)  hyprctl dispatch workspace 1 ;;
  2:down)  hyprctl dispatch workspace 4 ;;

  3:up)    hyprctl dispatch workspace 1 ;;
  3:right) hyprctl dispatch workspace 4 ;;

  4:up)    hyprctl dispatch workspace 2 ;;
  4:left)  hyprctl dispatch workspace 3 ;;
esac
