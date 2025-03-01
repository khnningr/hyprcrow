#!/usr/bin/env zxpy


#print(prueba)
if ~"pacman -Qi nano":
    print(f"Prueba, sí está instalado.")
else:
    ~"sudo pacman -S --needed rate-mirrors"



