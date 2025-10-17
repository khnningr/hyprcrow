#!/usr/bin/env bash

REPOS=(
  "${HOME}/hyprcrow/"
  "${HOME}/Wallpapers/"
  "${HOME}/kh-home"
)


actualizar_repositorio() {
  #if ! grep "email" ~/.gitconfig > /dev/null 2>&1; then
   # echo -e "\nIngrese el nombre de usuario"
    #read -p "> " MAIL
    #git config --global user.email "$MAIL"
  #fi
  #if ! grep "name" ~/.gitconfig  > /dev/null 2>&1; then
	  #echo -e "\nIngrese el nombre de usuario"
	  #read -p "> " USUARIO
	  #git config --global user.name "$USUARIO"
  #fi
  local REPOSITORIO="$1"

  echo -e "\n$REPOSITORIO"
  cd "$REPOSITORIO" || return 1
  
  git pull
  git add .

  COMMIT=$(gum input --placeholder "Mensaje del commit" --prompt "Commit> ")  

  if [[ -n "$COMMIT" ]]; then
    git commit -m "$COMMIT"
    git push -u origin main
    echo "$REPOSITORIO actualizado correctamente."
  else
    echo "× Commit cancelado para $REPOSITORIO"
  fi
}

mapfile -t ELEGIR_REPOS < <(printf '%s\n' "${REPOS[@]}" | gum choose --no-limit --header 'Seleccione los repositorios para actualizar: ')  

for REPOSITORIO in "${ELEGIR_REPOS[@]}"; do  
  if [[ -n "$REPOSITORIO" ]]; then  
    actualizar_repositorio "$REPOSITORIO"  
  fi  
done




#actualizar_repositorio ~/Obsidian/

#actualizar_repositorio ~/hyprcrow/

#actualizar_repositorio ~/.dotfiles/

#actualizar_repositorio ~/Wallpapers/

#actualizar_repositorio ~/Neovim/

#actualizar_repositorio ~/Biblioteca/

#actualizar_repositorio ~/Proyectos/

#actualizar_repositorio ~/kh-home

