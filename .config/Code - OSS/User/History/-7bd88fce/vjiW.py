#!/usr/bin/env zxpy

prueba = ~"pacman -Qi | grep vivaldi"
#print(prueba)
if prueba:
    print(f"Prueba, sí está instalado.")
else:
    ~"sudo pacman -S --needed rate-mirrors"
    print(f"No lo está")


