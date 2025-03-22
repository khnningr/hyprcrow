#!/usr/bin/env python3

import subprocess

"""Este es un ejemplo de como usar subprocess
Referencia: """
def ejemplo_subprocess():
    comando = "curl -I google.es | grep 'HTTP' | awk '{print $2}'"
    salida = subprocess.run(comando, capture_output=True, shell=True)
    print(salida.stdout.decode())

#ejemplo_subprocess(

def prueba_pkg():
    comando = "if command -v pacman &> /dev/null; then  echo 'hola'"
    salida = subprocess.run(comando, capture_output=True, shell=True)
    print(salida.stdout.decode())
prueba_pkg()


def ejecutar_comando(comando):
    procesar_comando = comando
    salida_comando = subprocess.run(
            procesar_comando, 
            capture_output=True, 
            shell=True
            )
    print(salida_comando.stdout.decode())

def arch_actualizar_mirrorlist():
    while True:
        print(f"\n¿Deseas actualizar los mirrorlist? (s/n)")
        elegir = input(f"> ")
        elegir.upper
        print()

        if "S" in elegir:
            ejecutar_comando("sudo pacman -S --needed rate-mirrors")
           

#arch_actualizar_mirrorlist()
