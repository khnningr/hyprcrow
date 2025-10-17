#!/usr/bin/env bash

if ! command -v git &> /dev/null; then  
  echo "Git (git) no está instalado"  
    echo "Instálalo con: sudo pacman -S git"  
    exit 1  
fi

if ! command -v gum &> /dev/null; then  
  echo "Gum (gum) no está instalado"  
    echo "Instálalo con: sudo pacman -S gum"  
    exit 1  
fi 

# Verificar si gh está instalado  
if ! command -v gh &> /dev/null; then  
    echo "GitHub CLI (gh) no está instalado"  
    echo "Instálalo con: sudo pacman -S github-cli"  
    exit 1  
fi 

# Verificar si ya está autenticado  
if ! gh auth status &> /dev/null; then  
    echo "No estás autenticado en GitHub"  
      
    # Preguntar si quiere autenticarse ahora  
    if gum confirm "¿Deseas autenticarte con GitHub ahora?"; then  
        gh auth login  
    else  
        echo "Autenticación cancelada. No podrás hacer push a GitHub."  
        exit 1  
    fi  
fi 

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

  if ! git config --global user.name > /dev/null 2>&1; then  
    USER_NAME=$(gum input --placeholder "Nombre de usuario Git" --prompt "Usuario> ")  
    git config --global user.name "$USER_NAME"  
  fi  
    
  if ! git config --global user.email > /dev/null 2>&1; then  
    USER_EMAIL=$(gum input --placeholder "email@ejemplo.com" --prompt "Email> ")  
    git config --global user.email "$USER_EMAIL"  
  fi  

  echo -e "\n$REPOSITORIO"
  cd "$REPOSITORIO" || return 1
  
  git pull
  git add .

  COMMIT=$(gum input --placeholder "Mensaje del commit" --prompt "Commit> ")  

  if [[ -n "$COMMIT" ]]; then
    git commit -a -m "$COMMIT"
    git push -u origin main
    echo "$REPOSITORIO actualizado correctamente."
  else
    echo "× Commit cancelado para $REPOSITORIO"
  fi
}

mapfile -t ELEGIR_REPOS < <(printf '%s\n' "${REPOS[@]}" | \
  gum choose --no-limit \
  --header 'Seleccione los repositorios para actualizar: ')  

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

