#!/usr/bin/env zxpy
import subprocess


prueba = ~"sudo pacman -S nano"

#print(prueba)
if prueba:
    print(f"Prueba, sí está instalado.")
else:
    ~"sudo pacman -S --needed rate-mirrors"



