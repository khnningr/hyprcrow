#!/bin/bash

# Dar acceso para el usuario local al X server.
xhost +SI:localuser:root
# Correr aplicación.
gparted &
# Esperar a que gparted termine de ejecutar.
wait $!
# Revocar acceso a X server.
xhost -SI:localuser:root