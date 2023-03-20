#!/usr/bin/env zsh

eval "$(starship init zsh)"

znap install zsh-users/zsh-completions
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

znap source wfxr/forgit
path+=$(dirname $FORGIT)

# znap source kazhala/dotbare


