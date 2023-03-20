#!/usr/bin/env zsh


# znap source jeffreytse/zsh-vi-mode

# vi mode (the equivalent of `set -o vi`)
bindkey -v

# set 1ms timeout for Esc press so we can switch
# between vi "normal" and "command" modes faster
export KEYTIMEOUT=1

# Use vim keys in tab complete menu (2nd tab press):
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# by default backspace (^?) is bound to `vi-backward-delete-char`
# we want it to have the same bahvior as vim/nvim (i.e. backspace=del)
# without the below we will get stuck unable to backspace after Esc-k-A
bindkey -v '^?' backward-delete-char

# Better searching in vi command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
# disabled due to bad interaction with nvim-neoterm
#bindkey -M viins '^k' history-incremental-search-backward
#bindkey -M viins '^j' history-incremental-search-forward

# Change cursor shape for different vi modes.
# block cursor for cmd mode, line (beam) otherwise
#  1 -> blinking block
#  2 -> solid block 
#  3 -> blinking underscore
#  4 -> solid underscore
#  5 -> blinking vertical bar
#  6 -> solid vertical bar
# source: https://github.com/ohmyzsh/ohmyzsh/issues/9570
function zle-keymap-select {
  # https://vt100.net/docs/vt510-rm/DECSCUSR
  local _shape=0
  # $KEYMAP contains the new mode
  # $VI_KEYMAP contains the current mode
  # case "${1:-${VI_KEYMAP:-main}}" in
  case "${KEYMAP:-main}" in
    main)    _shape=5 ;; # vi insert: line
    viins)   _shape=5 ;; # vi insert: line
    isearch) _shape=6 ;; # inc search: line
    command) _shape=6 ;; # read a command name
    vicmd)   _shape=2 ;; # vi cmd: block
    visual)  _shape=2 ;; # vi visual mode: block
    viopp)   _shape=0 ;; # vi operation pending: blinking block
    *)       _shape=0 ;;
  esac
  printf $'\e[%d q' "${_shape}"
}
zle -N zle-keymap-select
# https://superuser.com/questions/685005/tmux-in-zsh-with-vi-mode-toggle-cursor-shape-between-normal-and-insert-mode
_set_beam_cursor() { echo -ne '\e[5 q' }
# ensure beam cursor when starting new terminal
precmd_functions+=(_set_beam_cursor)
# ensure insert mode and beam cursor when exiting vim
zle-line-init() { zle -K viins; _set_beam_cursor }
zle -N zle-line-init
