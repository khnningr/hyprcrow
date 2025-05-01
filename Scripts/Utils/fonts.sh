mkdir -p ~/.local/share/fonts
wget -O ~/.local/share/fonts/Iosevka.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip
unzip ~/.local/share/fonts/Iosevka.zip -d ~/.local/share/fonts/
fc-cache -fv
