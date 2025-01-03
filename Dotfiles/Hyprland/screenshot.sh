#!/bin/bash


DIR="$HOME/Imágenes/screenshots/"
NAME="captura_$(date +%d-%m-%Y_%H:%M:%S).png"
FILE="${DIR}${NAME}"
mkdir -p "$DIR"

option1="Selección de área"
option2="Captura de ventana"
option3="Captura panorámica"
option4="Selección de área: guarda la capura"
option5="Captura de ventana: guarda la capura"
option6="Captura panorámica: guarda la capura"

options="$option1\n$option2\n$option3\n$option4\n$option5\n$option6"

choice=$(echo -e "$options" | rofi -dmenu -i -no-show-icons -l 3 -width 5 -p "Seleccione un modo de Screenshot...")

case $choice in
    $option1)
	notify-send -t 1000 "Modo: Selección de área"
	grim -g "$(slurp -b 1B1F28CC -c E06B74ff -s C778DD0D -w 2)" - | swappy -f - 
	notify-send -i "Captura tomada"
	
    ;;
    $option2)
	sleep 1
	grim -o "$(hyprctl -j monitors | jq -r '.[] | select(.focused).name')" - | swappy -f -
	notify-send "Captura tomada" && notify-send "Modo: Captura de ventana"
    ;;
    $option3)
	sleep 0.2
	grim - | swappy -f -
	notify-send "Captura tomada" && notify-send "Modo: Captura panorámica"
    ;;
	$option4)
	grim -g "$(slurp -b 1B1F28CC -c E06B74ff -s C778DD0D -w 2)" "$FILE" | wl-copy
	notify-send "Captura guardada en $FILE" && notify-send "Copiada en portapapeles" && notify-send "Modo: Selección de área"
    ;;
    $option5)
	sleep 0.2
	grim -o "$(hyprctl -j monitors | jq -r '.[] | select(.focused).name')" "$FILE" | wl-copy
	notify-send "Captura guardada en $FILE" && notify-send "Copiada en portapapeles" && notify-send "Modo: Captura de ventana"
    ;;
    $option6)
	sleep 0.2
	grim "$FILE" | wl-copy
	notify-send "Captura guardada en $FILE" && notify-send "Copiada en portapapeles" && notify-send "Modo: Captura panorámica"
    ;;
	*) exit 1
	;;
esac

if [ -f "${FILE}" ]; then
	notify-send -a "t2" -i "${FILE}" "Captura guardada en: ${DIR}"
fi


# Screenshots en area:
# grim -g "$(slurp -b 1B1F28CC -c E06B74ff -s C778DD0D -w 2)" - | wl-copy # La copia en el portapapeles.
#
# Screenshots panoramicas.
# grim - | wl-copy # Solo la copia en el portapapeles.
# grim $HOME/`date +%Y-%m-%d_%H:%M:%S`.png | wl-copy # La copia en el portapapeles y la guarda en un directorio con un nombre personalizado.
# grim | wl-copy # La copia en el portapapeles y la guarda en $HOME ya que no se especifica.
#
