#!/usr/bin/env bash

# """
# Este script crea repositorios, pero
# deben estar vacios. Sin readme, por
# ejemplo.
#
# Debes pasar los siguientes argumentos para
# $1 y $2, en ese orden.
#
# 1. Debes escribir el directorio que desea
# convertir en un repositorio.
#
# 2. Debes escribir el URL del repositorio.\n"
#
# Ejemplo: ./init.sh $1 $2
#
# """

cd $1
git init
git add .
git commit -m "Cambio realizado: $(date +'%Y/%m/%d a las %I:%M %p')"
git branch -M main
git remote add origin $2
git push -u origin main
