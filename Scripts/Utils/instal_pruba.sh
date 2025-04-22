#!/usr/bin/env bash

function menu {
  # Prefuntar.

  local opciones=(
    "Volver"
    "Todo"
    "Navegador"
    "Firewall"
  )
  local elegir
  select elegir in "${opciones[@]}"; do 
    case "$elegir" in 
      "Volver")
        break 
        ;;
      "Todo")
        # Llama a todas las funciones.
        ;;
      "Navegador")
      # funciones
        ;;
      *)
        echo "Opcion unvalidad"
        ;;
    esac
  done

}
