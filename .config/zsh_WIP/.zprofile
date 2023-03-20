#!/usr/bin/env zsh
#                                       ███ ██ ███
#                                      ██░ ░░ ░░██
#      ██████ ██████  ██████  █████   ░██   ██ ░██   █████
#     ░░░░██ ░██░░░██░░██░░█ ██░░░██ ██████░██ ░██  ██░░░██
#        ██  ░██  ░██ ░██ ░ ░██  ░██░░░██░ ░██ ░██ ░███████
#       ██   ░██████  ░██   ░██  ░██  ░██  ░██ ░██ ░██░░░░
#  ██  ██████░██░░░   ███   ░░█████   ░██  ░██ ░██ ░░█████
# ░░  ░░░░░░ ░██     ░░░     ░░░░░    ░░   ░░  ░░   ░░░░░
#            ░░

# Executes commands at login pre-zshrc.


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
