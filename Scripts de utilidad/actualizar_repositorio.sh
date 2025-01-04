#!/usr/bin/env bash

actualizar_repositorio() {
  cd $1
  git add .
  git commit -a -m "Cambio realizado: $(date +'%Y/%m/%d a las %I:%M %p')"
  git push -u origin main
  sleep 10
}

actualizar_repositorio ~/obsidian_vault/

actualizar_repositorio ~/dotfiles/

actualizar_repositorio ~/Wallpapers/
