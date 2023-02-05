#--- XDG ----------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"
#------------------------------------------------------------------------------


#--- APP HOME -----------------------------------------------------------------
export VOLTA_HOME="$XDG_DATA_HOME/volta"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export _Z_DATA="$XDG_DATA_HOME/z"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
#------------------------------------------------------------------------------


#--- EXPORT -------------------------------------------------------------------
export HISTSIZE=5000
export SAVEHIST=5000
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LC_COLLATE="C"
export TZ="Europe/Paris"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER='bat -p'
export LESS='-g -i -M -R -S -w -z-4'

export TERMINAL="alacritty"
export BROWSER="microsoft-edge-stable"
export VISUAL="nvim"
export EDITOR="nvim"

