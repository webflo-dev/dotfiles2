#!/usr/bin/env zsh
#                     ██
#                    ░██
#      ██████  ██████░██████  ██████  █████
#     ░░░░██  ██░░░░ ░██░░░██░░██░░█ ██░░░██
#        ██  ░░█████ ░██  ░██ ░██ ░ ░██  ░░
#       ██    ░░░░░██░██  ░██ ░██   ░██   ██
#  ██  ██████ ██████ ░██  ░██░███   ░░█████
# ░░  ░░░░░░ ░░░░░░  ░░   ░░ ░░░     ░░░░░


#―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
#  Paths
#―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath path

# Set the list of directories that Zsh searches for programs.
path+=(
#  /usr/local/{bin,sbin}
  $HOME/.local/bin
  $CARGO_HOME/bin
  $VOLTA_HOME/bin
  $GOPATH/bin
  $BUN_INSTALL/bin
  $XDG_CONFIG_HOME/spicetify
)



# Set the list of directories that cd searches.
cdpath=(
  $XDG_CONFIG_HOME
  $cdpath
)


# Plugin manager invocation {{{
declare -A ZNAP 
ZNAP[PLUGINS]="$XDG_DATA_HOME/zsh/plugins"
ZNAP[SELF]="$ZNAP[PLUGINS]/zsh-snap"
ZNAP[BIN]="$ZNAP[SELF]/znap.zsh"

if [[ ! -s $ZNAP[BIN] ]]; then
  git clone --depth 1 'https://github.com/marlonrichert/zsh-snap.git' $ZNAP[SELF]
fi
source $ZNAP[BIN]
# }}}


# Core zsh settings {{{
declare -A ZSH
ZSH[cache]="$XDG_CACHE_HOME/zsh"
ZSH[completions]="$XDG_DATA_HOME/zsh/site-functions"
ZSH[scripts]="$ZSH[cache]/scripts"

[ -d $ZSH[completions] ] || mkdir -p $ZSH[completions]
[ -d $ZSH[scripts] ] || mkdir -p $ZSH[scripts]


fpath+=(
  $ZSH[completions]
)


# Basic auto/tab complete:
autoload -U +X compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zmodload -i zsh/complist


source "$ZDOTDIR/core.zsh"
source "$ZDOTDIR/aliases.zsh"
[ -f "$ZDOTDIR/functions.zsh" ] && source "$ZDOTDIR/functions.zsh"
[ -f "$ZDOTDIR/plugins.zsh" ] && source "$ZDOTDIR/plugins.zsh"
# [ -f "$ZDOTDIR/vi-mode.zsh" ] && source "$ZDOTDIR/vi-mode.zsh"


