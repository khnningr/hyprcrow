#!/usr/bin/env zxpy
import subprocess

try:
    prueba = "sudo pacman -S --needed nano"
    salida = subprocess.run(prueba, capture_output=True, shell=True)
    print(salida.stdout.decode())
    #print(prueba)
    if prueba:
        print(f"Prueba, sí está instalado.")
    else:
        ~"sudo pacman -S --needed rate-mirrors"
except TypeError:
    print(f"Paquete no instalado.")


