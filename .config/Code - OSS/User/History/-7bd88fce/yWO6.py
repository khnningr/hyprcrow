#!/usr/bin/env zxpy
try:
    prueba = ~"pacman -Qi vivaldi"
    #print(prueba)
    if prueba:
        print(f"Prueba, sí está instalado.")
    else:
        ~"sudo pacman -S --needed rate-mirrors"
except TypeError:
    print(f"Paquete no instalado.")


