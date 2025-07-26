# Default programs
export EDITOR="zeditor"
export TERMINAL="wezterm"
export TERM="wezterm"
export VISUAL="zeditor"
# export BROWSER="librewolf"
export MANPAGER='nvim +Man!' # Visualiza las man-pages, mediante Neovim.
export SHELL="/bin/zsh"

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

# Añadir directorios al PATH.
export PATH="$HOME/.local/bin:$PATH"

# ~/ Clean-up:
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# Other programs
# export QT_QPA_PLATFORMTHEME="gtk2"        # Have QT use gtk2 theme.
export _JAVA_AWT_WM_NONREPARENTING=1      # Fix for Java applications in dwm
. "$XDG_CONFIG_HOME/cargo/env"

# Corregir fonts en ventanas JAVA.
export AWT_FONT_FAMILY='Iosevka Term Nerd Font'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export JAVA_TOOL_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
