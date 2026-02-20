#!/bin/bash

# Elige tu lanzador: wofi (Wayland) o rofi (X11)
LAUNCHER="wofi --show dmenu"
# LAUNCHER="rofi -dmenu -i -p Power"

# Opciones del menú con iconos (necesitas una Nerd Font para verlos)
OPTIONS="⏻ Apagar\n⭮ Reiniciar\n Cerrar Sesión\n Bloquear\n Cancelar"

# Muestra el menú y captura la opción seleccionada
choice=$(echo -e "$OPTIONS" | $LAUNCHER)

# Ejecuta una acción basada en la elección
case "$choice" in
"⏻ Apagar")
  systemctl poweroff
  ;;
"⭮ Reiniciar")
  systemctl reboot
  ;;
" Cerrar Sesión")
  # El comando para cerrar sesión depende de tu gestor de ventanas
  # Para Sway:
  swaymsg exit
  # Para Hyprland:
  # hyprctl dispatch exit
  # Para i3:
  # i3-msg exit
  ;;
" Bloquear")
  # Usa el script o programa que tengas para bloquear la pantalla, ej: swaylock
  swaylock
  ;;
" Cancelar")
  exit 0
  ;;
esac
