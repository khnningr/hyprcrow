#!/bin/bash



chosen=$(echo -e "  Apagar\n  Reiniciar\n  Suspender\n  Hinbernar\n  Bloquear\n  Salir" | rofi -dmenu -i -theme-str '@import "power.rasi"')

case "$chosen" in
	"  Apagar") poweroff ;;
	"  Reiniciar") reboot ;;
	"  Suspender") systemctl suspend-then-hibernate ;;
	"  Hinbernar") systemctl hibernate ;;
	"  Bloquear") betterlockscreen -l ;;
	"  Salir") bspc quit ;;
	*) exit 1 ;;
esac
