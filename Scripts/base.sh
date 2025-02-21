#!/bin/bash

dotfiles=$HOME/hyprcrow


# Acá se encuentran funciones de configuración
# y utilidad tando para Arch Linux como en Fedora.

banner(){
  echo -e "\n\t=== === === === === === === === === === ==="
  echo -e "\t=== === ===   HYCROW Arch Linux   === === ==="
	echo -e "\t=== === === === === === === === === === ===\n"
}

base_yazi_portal(){
  mkdir -p ~/.clone

  git clone https://github.com/hunkyburrito/xdg-desktop-portal-termfilechooser ~/.clone/xdg-desktop-portal-termfilechooser
  
  sudo cp -r ~/.clone/xdg-desktop-portal-termfilechooser/termfilechooser.portal /usr/share/xdg-desktop-portal/portals/
  
  find /usr/share/xdg-desktop-portal/portals -name '*.portal' -not -name\
    'termfilechooser.portal' -exec grep -q 'FileChooser' '{}' \; -exec \
    sudo sed -i'.bak' 's/org\.freedesktop\.impl\.portal\.FileChooser;\?//g' '{}' \;
  
  systemctl --user restart xdg-desktop-portal.service

  # Test: GDK_DEBUG=portals  zenity --file-selection

  systemctl --user restart xdg-desktop-portal-termfilechooser.service

  #systemctl --user stop xdg-desktop-portal-termfilechooser.service
  #/usr/local/libexec/xdg-desktop-portal-termfilechooser -l TRACE -r &

}

base_oh_my_zsh(){
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
  git clone https://github.com/zsh-users/zsh-autosuggestions\
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git\
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-history-substring-search\
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
  
  chsh -s $(which zsh)
}

base_dotfiles_stow(){
  while [ true ]; do
    clear
    echo -e "\n¿Desea copiar los dotfiles? (s/n)"
    read -p "> " elegir
    echo ""

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      cd "$dotfiles"
      stow .
      sudo cp -r "$dotfiles"/.config/nano/nanorc /etc/
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\tDotfiles no copiados."
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

# Función para definir reglas de Uncomplicated Firewall 
# o UFW.
#
# Para eliminar un una regla puedes usar los siguientes
# comandos:
# 1. Imprime un estado y sus reglas definidas pero enumeradas.
# sudo ufw status numbered
# 2. Para eliminar como tal la regla.
# sudo ufw delete «NÚMERO DE LA REGLA A BORRAR»
#
# También podemos ver una lista de nombres de 
# servicios conocidos por ufw, con el comando:
# sudo ufw app list
#
# Para bloquear una IP en especifico, usas el comando:
# sudo ufw deny from «DIRECCIÓN IP»
# 
# Referencia: https://www.youtube.com/watch?v=fcxirBuDnXY
base_reglas_ufw(){
  sudo ufw status # Verifica el estado de ufw (activo/inactivo)
  sudo ufw reset # Elimina las reglas establecidas.
  sudo ufw default deny incoming # Niega el tráfico que entra.
  sudo ufw default deny outgoing # Niega todo lo que sale.
  # Para desabilitar ufw, basta con usar el comando:
  # sudo ufw disable
  sudo ufw enable # Activa el firewall ahora, y al inicio del sistema.

  sudo ufw allow out https # Salida por el puerto 443 o https.
  sudo ufw allow in https # Entrada por el puerto 443 o https.

  sudo ufw allow out http # Salida por el puerto 80 o http.
  sudo ufw allow in http # Entrada por el puerto 80 o http.

  # Es necesario habilitar el puerto 53 para,
  # habilitar el acceso a internet, no basta 
  # con habilitar los puertos 80 y 443.
  sudo ufw allow out 53 # Salida por el puerto 53 o dns.
  sudo ufw allow in 53 # Entrada por el puerto 53 o dns.
  # Reglas parar Warframe.
  sudo ufw allow out 4950
  sudo ufw allow in 4950

  sudo ufw allow out 4955
  sudo ufw allow in 4955

  sudo ufw allow out 6695
  sudo ufw allow in 6695

  sudo ufw allow out 6696
  sudo ufw allow in 6696

  sudo ufw allow out 6697
  sudo ufw allow in 6697

  sudo ufw allow out 6698
  sudo ufw allow in 6698

  sudo ufw allow out 6699
  sudo ufw allow in 6699

  sudo ufw reload # Recarga el servicio al hacer cambios en reglas.
  sudo ufw status
}

base_tty_login(){
  while [ true ]; do
    if grep -q "Hyprland" ~/.bash_profile ||\
      grep -q "Hyprland" ~/.zprofile; then
      echo -e "\t\ntty1, ya funciona como display manager."
      break 
    fi 

    echo -e "\nEstá función permite establecer tty1, como display manager."
    echo -e "\n\tLos archivos .bash_profile para bash y .zprofile para zsh,"
    echo -e "\tse encuentran en el directorio $HOME."
    echo -e "\n¿Deseas modificar .bash_profile y/o .zprofile? (s/n)"
    read -p "> " elegir

    if [[ -z "$elegir" || "$elegir" == "s" || "$elegir" == "S" ]]; then
      while [ true ]; do 
        local shell_elegido=""
        echo -e "\n¿Cuál shell usas:"
        echo "1. ZSH"
        echo "2. BASH"
        read -p "> " elegir

        if [[ "$elegir" == "1" ]]; then 
          shell_elegido=.zprofile
          break 
        elif [[ "$elegir" == "2" ]]; then
          shell_elegido=.bash_profile
          break 
        else
          echo -e "\n\tOpción no valida. Intente de nuevo."
        fi 
      done

      echo -e "\n# Está configuración deber ir en: $HOME/$shell_elegido" \
        >> "$HOME"/"$shell_elegido"
      echo -e "# Establece el tty1, como si fuese un display manager." \
        >> "$HOME"/"$shell_elegido"
      echo -e 'if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then' \
        >> "$HOME"/"$shell_elegido"
      echo -e ' exec Hyprland' \
        >> "$HOME"/"$shell_elegido"
      echo -e 'fi' \
        >> "$HOME"/"$shell_elegido"
      
      cat "$HOME"/"$shell_elegido"

      echo -e "\n> TTY1, ahora funciona como display manager.\n"
      break
    elif [[ "$elegir" == "n" || "$elegir" == "N" ]]; then
      echo -e "\nNo se ha modificado el archivo.\n"
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done
}

base_lemurs_login(){
  
  echo -e "#!/bin/sh" | \
    sudo tee /etc/lemurs/wayland/hyprland.sh > /dev/null
  
  echo -e "exec Hyprland" | \
    sudo tee -a /etc/lemurs/wayland/hyprland.sh > /dev/null
  
  sudo chmod +x /etc/lemurs/wayland/hyprland.sh
}

base_plugins_hyprland(){  
  while [ true ]; do
    echo -e "\n¿Cuáles plugins deseas instalar?"
    echo "1. hyprexpo"
    echo "2. hyprspace"
    echo "0. Salir"
    read -p "> " elegir
    echo ""
    
    if [[ "$elegir" == "1" ]]; then
      hyprpm update
      hyprpm add https://github.com/hyprwm/hyprland-plugins
      hyprpm enable hyprexpo
    elif [[ "$elegir" == "2" ]]; then
      hyprpm update
      hyprpm add https://github.com/KZDKM/Hyprspace
      hyprpm enable Hyprspace
    elif [[ "$elegir" == 0 ]]; then
      break
    else
      echo -e "\n\tOpción no valida. Intente de nuevo.\n"
    fi
  done

}

# Está función permite configurar
# virt-manager.
#
# La siguiente referencia se usa en Arch Linux, 
# pero igual sirve como ejemplo a nivel de configuración:
# Referencia: https://www.youtube.com/watch?v=HN-krqqblOA 
#
# Está otra referencia es para Fedora.
# Referencia: https://fedoramagazine.org/full-virtualization-system-on-fedora-workstation-30/
base_virt_manager(){
  echo "prueba de archivos"
  # Descomentar las lineas 85 y 108.
  # unix_socket_group = "libvirt"
  # unix_socket_rw_perms = "0770"
  # sudo nano /etc/libvirt/libvirtd.conf
  sudo sed -i '85,108s/^#//' /etc/libvirt/libvirtd.conf
  
  # Añadir el usuario actual al grupo kvm y libvirt.
  sudo usermod -a -G kvm,libvirt $(whoami)

  # Habilitar servicios necesarios.
  sudo systemctl enable --now libvirtd.service

  # Descomentar las líneas 519 y 523.
  # user = "usuario"
  # group = "libvirt"
  sudo sed -i 's/^#user = "libvirt-qemu"/user = "'"$(whoami)"'"/' \
    /etc/libvirt/qemu.conf
  sudo sed -i 's/^#group = "libvirt-qemu"/group = "'"$(whoami)"'"/' \
    /etc/libvirt/qemu.conf 

  # Configuración de redes virtuales.
  sudo virsh net-autostart default

  # Habilitar la virtualización con el firewall activo.
  # Descomentar línea 29.
  # firewall_backend = "nftables"
  # sudo sed -i 's/^#firewall_backend = "iptables"/firewall_backend = "nftables"/' /etc/libvirt/network.conf

  # Reiniciar el servicio.
  sudo systemctl restart libvirtd.service

  # Comprobar que se han habilitado los servicios.
  # sudo systemctl status libvirtd.service

  # Cambiar el grupo actual del usuario sin necesidad de cerrar sesion.
  newgrp libvirt

  # sudo reboot

}

