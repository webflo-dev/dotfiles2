export FZF_DEFAULT_COMMAND='fd --type file --type directory --absolute-path --follow --hidden --exclude .git --exclude node_modules --color=always'
export FZF_CTRL_R_OPTS='--prompt "History > "'
# export FZF_DEFAULT_OPTS="--ansi --color fg:$(xrdb -get "*.color7") --color fg+:$(xrdb -get "*.color0") --color bg:$(xrdb -get "*.background") --color bg+:$(xrdb -get "*.color3") --color hl:$(xrdb -get "*.color10") --color hl+:$(xrdb -get "*.color3")  --color prompt:$(xrdb -get "*.color1") --color spinner:$(xrdb -get "*.color12") --color pointer:$(xrdb -get "*.color4") --color marker:$(xrdb -get "*.color4")  --prompt '  ' --pointer ' λ' --layout=reverse --border horizontal --height 40"
#export FZF_DEFAULT_OPTS="--ansi --prompt '  ' --layout=reverse --border horizontal"
export FZF_DEFAULT_OPTS="--ansi --prompt '  ' --layout=reverse --"
export FZF_CTRL_T_OPTS='--prompt "Files > "'
export FZF_ALT_C_OPTS='--prompt "Directories > "'


source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
