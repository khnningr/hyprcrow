#!/bin/bash

function ohmyzsh 
{

local elegir

while [ true ]; do

echo -e "\n¿Deseas instalar OH-MY-ZSH? (s/n)"
read -p "> " elegir

if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then

sudo pacman -S --needed zsh curl pokemon-colorscripts-git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

cp -v $HOME/hyprcrow/Dotfiles/Zsh/.zshrc ~/.zshrc

chsh -s $(which zsh)

break

elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then

echo -e "\n\tNo se ha instalado OH-MY-ZSH."
break

else

echo -e "\n\tOpción no valida. Intente de nuevo.\n"

fi

done
}
