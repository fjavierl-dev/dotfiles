#!/usr/bin/env bash

CONFIG="$HOME/.config/waybar/config"
HYPR_WS="$HOME/.config/hypr/workspaces.conf"

if grep -q '"modules-left": \["custom/ws-grid"' "$CONFIG"; then
    # ===== DESACTIVAR =====

    # Quitar módulo visual
    sed -i 's/"modules-left": \["custom\/ws-grid",/"modules-left": [/' "$CONFIG"
    sed -i 's/"modules-left": \["custom\/ws-grid"\]/"modules-left": []/' "$CONFIG"

    # Vaciar workspaces reales
    echo "" > "$HYPR_WS"

    # Forzar volver al workspace 1
    hyprctl dispatch workspace 1

    # Recargar Hyprland
    hyprctl reload

    notify-send "Workspaces disabled (Single mode)"

else
    # ===== ACTIVAR =====

    # Agregar módulo visual
    sed -i 's/"modules-left": \[/"modules-left": ["custom\/ws-grid", /' "$CONFIG"

    # Restaurar workspaces reales
    cat > "$HYPR_WS" <<EOF
workspace = 1, persistent:true
workspace = 2, persistent:true
workspace = 3, persistent:true
workspace = 4, persistent:true
EOF

    # Recargar Hyprland
    hyprctl reload

    notify-send "Workspaces enabled (Multi mode)"
fi

# Recargar Waybar
pkill -USR2 waybar
