#!/usr/bin/env bash

actualizar_repositorio() {
  cd $1
  git add .
  git commit -a -m "Cambio realizado: $(date +'%Y/%m/%d a las %I:%M %p')"
  git push -u origin main
  sleep 10
}

actualizar_repositorio ~/Obsidian/

actualizar_repositorio ~/hyprcrow/

actualizar_repositorio ~/Wallpapers/

#actualizar_repositorio ~/Neovim/

#actualizar_repositorio ~/Biblioteca/

actualizar_repositorio ~/Proyectos/
