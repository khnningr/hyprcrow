#!/bin/bash

package="rate-mirrors-bin"

while true; do
  paru -S --needed "$package"
  if [ $? -eq 0 ]; then
    echo "Paquete instalado exitosamente."
    break
  else
    echo "Error al instalar el paquete. Intentando de nuevo en 5 segundos..."
    sleep 5
  fi
done