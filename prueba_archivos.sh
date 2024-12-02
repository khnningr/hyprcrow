#!/bin/bash

# Ruta al archivo que contiene la lista de aplicaciones
archivo="../Scripts/packages/android.txt"

# Leer las aplicaciones desde el archivo en un array
mapfile -t aplicaciones < "$archivo"

# Menú interactivo
echo "Selecciona las aplicaciones que deseas instalar (escribe el número y presiona Enter):"

select opcion in "${aplicaciones[@]}" "Instalar todas" "Salir"; do
    case $opcion in
        "Instalar todas")
            echo "Instalando todas las aplicaciones..."
            sudo pacman -S --needed "${aplicaciones[@]}"
            break
            ;;
        "Salir")
            echo "Saliendo..."
            break
            ;;
        *)
            if [[ " ${aplicaciones[@]} " =~ " $opcion " ]]; then
                echo "Instalando $opcion..."
                sudo pacman -S --needed "$opcion"
            else
                echo "Opción inválida. Intente de nuevo."
            fi
            ;;
    esac
done