# source .zshrc - comando para resetear la configuración del shell.

# Añadir directorios al PATH.
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

# Para macOS.
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Ubicación del gestor de plugins, zinit y los plugins.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Se le conoce a "${XDG_DATA_HOME:-${HOME}/.local/share}", como 'Parameter
# Expansion' y me permite definir una nueva variable de entorno.
#
# '${XDG_DATA_HOME}' - es una variable de entorno que, si está definida,
# contendrá la ruta a un directorio específico donde se almacenan los
# datos de usuario.
#
# ':-' - es un operador de sustitución de parámetros en Bash. Significa
# "si la variable no está definida o está vacía, usa el valor que sigue
# a este operador". En este caso, si XDG_DATA_HOME no está definida, se
# utilizará el valor predeterminado que sigue, ${HOME}/.local/share.

# Descarga Zinit en caso de que no exista.
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$dirname $ZINIT_HOME"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/carga zinit
source "${ZINIT_HOME}/zinit.zsh"
# 'zinit zstatus' - comando para ver el estatus de zinit.

# Programas
export TERM=wezterm
export EDITOR=zed # nvim
export VISUAL=zed
export BROWSER=vivaldi
export SHELL="/bin/zsh"

# Añadir ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Añadir snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Cargar referencias de autocompletado de zsh-completions.
autoload -Uz compinit && compinit

zinit cdreplay -q

# OH-MY-POSH
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/kh.toml)"

# Keybindings
bindkey -e
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
bindkey '^[w' kill-region
# bindkey '^\n' backward-kill-word # Por defecto, se hace con «ctrl»del

# Historial
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias nvim='nvim'
alias c='clear'
alias m='mirror'
alias s='paru'
alias u='sudo pacman -Syu && paru -Syu' # dnf upgrade
alias i='paru -S --needed' # dnf install
alias r='paru -Rns' # dnf remove
alias lz='exa --icons --color=always'
alias parus="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S --needed"
alias parux="paru -Qq | fzf --preview 'paru -Qil {}' --layout=reverse --bind 'enter:execute(paru -Qil {} | bat)'"
alias parui="paru -Qe | fzf --preview 'paru -Qil | awk {$1}' --layout=reverse --bind 'enter:execute(paru -Qil | awk {$1} | bat)'"
alias zed="xdg-open"

# Shell integrations
eval "$(fzf --zsh)" # <CTRL>R.
eval "$(zoxide init --cmd cd zsh)"
# eval "$(zellij setup --generate-auto-start zsh)"
# 'zellij list-sessions' - lista todas las sesiones.
# 'zellij a «NOMBRE SESIÓN»' - abre una sesión en concreto.
# 'zellij kill-all-sessions' - cierra todas las sesiones.

# Corregir fonts en ventanas JAVA.
export AWT_FONT_FAMILY='Iosevka Term Nerd Font'
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'
export JAVA_TOOL_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true'

# Paleta de colores, para los terminales.
#source ~/.local/bin/variables.sh
#sh ~/.local/bin/terminal.sh

#pokemon-colorscripts --no-title -r 1,3,6
