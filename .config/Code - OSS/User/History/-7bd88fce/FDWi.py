#!/usr/bin/env zxpy
try:
    prueba = ~"pacman -Qi | grep vivaldi"
    #print(prueba)
    if prueba:
        print(f"Prueba, sí está instalado.")
except TypeError:
    print(f"Paquete no instalado.")
    ~"sudo pacman -S --needed rate-mirrors"


