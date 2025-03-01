#!/usr/bin/env zxpy
import subprocess

try:
    prueba = "sudo pacman -S nano"
    salida = subprocess.run(prueba, capture_output=True, shell=True)
    print(salida.stdout.decode())
    #print(prueba)
    if prueba == None:
        print(f"Prueba, sí está instalado.")
    else:
        ~"sudo pacman -S --needed rate-mirrors"
except TypeError:
    print(f"Paquete no instalado.")


