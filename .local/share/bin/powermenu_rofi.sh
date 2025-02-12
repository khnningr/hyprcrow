#!/bin/bash

dir_rofi="$HOME/.config/rofi"
file_powermenu="powermenu.rasi"

apagar="⏻ Apagar"
reiniciar=" Reiniciar"
bloquear=" Bloquear"
suspender=" Suspender"
logout="󰿅 Logout"
si="Sí"
no="No"

uptime="`uptime -p | sed -e 's/up //g'`"







function menu_rofi
{
	rofi -dmenu \
		-theme powermenu.rasi
}





function confirmar_mensaje {
	if [ "$1" == "logout" ]; then
		rofi -dmenu \
			-p "Sesión: $uptime" \
			-mesg "¿Quieres cerrar sesión?" \
			-theme confirmar.rasi
	else
		rofi -dmenu \
			-p "Sistema: $uptime" \
			-mesg "¿Quieres $1 el equipo?" \
			-theme confirmar.rasi
	fi
}

function confirmar_accion {
	echo -e "$si\n$no" | confirmar_mensaje $1
}

function powermenu_rofi
{
	echo -e "$apagar\n$reiniciar\n$bloquear\n$suspender\n$logout" | menu_rofi
}

function elegir
{
	

	chosen="$(powermenu_rofi)"
	if [ "$chosen" == "$apagar" ]; then
		selected="$(confirmar_accion "apagar el equipo")"
		if [ "$selected" == "$si" ]; then
			systemctl poweroff
		else
			exit
		fi
	elif [ "$chosen" == "$reiniciar" ]; then
		selected="$(confirmar_accion "reiniciar")"
		if [ "$selected" == "$si" ]; then
			systemctl reboot
		else
			exit
		fi
	elif [ "$chosen" == "$bloquear" ]; then
		selected="$(confirmar_accion "bloquear")"
		if [ "$selected" == "$si" ]; then
			loginctl lock-session
		else
			exit
		fi
	elif [ "$chosen" == "$suspender" ]; then
		selected="$(confirmar_accion "suspender")"
		if [ "$selected" == "$si" ]; then
			systemctl suspend
		else
			exit
		fi
	elif [ "$chosen" == "$logout" ]; then
		selected="$(confirmar_accion "logout")"
		if [ "$selected" == "$si" ]; then
			loginctl kill-session $XDG_SESSION_ID
		else
			exit 1
		fi
	fi
}

elegir
#selected="$(confirmar_accion)"
