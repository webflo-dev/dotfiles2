setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.


export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config


export PATH="$HOME/.local/bin:$CARGO_HOME/bin:$VOLTA_HOME/bin:$GOPATH/bin:$XDG_CONFIG_HOME/spicetify:$PATH"


autoload -Uz compinit
compinit
_comp_options+=(globdots)

source $ZDOTDIR/oh-my-zsh.zsh

source $ZDOTDIR/_aliases.zsh
source $ZDOTDIR/_functions.zsh



if [[ -d $ZDOTDIR/plugins ]]; then
  for file in $ZDOTDIR/plugins/*.zsh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
    unset file
  done
fi

source $ZDOTDIR/plugins/forgit/forgit.plugin.zsh
source ~/dev/castor/__castor.zsh

