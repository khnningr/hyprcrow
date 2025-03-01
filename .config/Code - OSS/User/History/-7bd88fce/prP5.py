#!/usr/bin/env zxpy


~"sudo pacman -Syu"
"""
prueba = ~"pacman -Qi nano"
#print(prueba)
if prueba:
    print(f"Prueba, sí está instalado.")
else:
    ~"sudo pacman -S --needed rate-mirrors"
    print(f"No lo está")


"""