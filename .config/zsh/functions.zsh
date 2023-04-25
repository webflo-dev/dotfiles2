
function mkcd() {
   mkdir -p "$@" && cd "$_";
}

function bak() {
	cp -r "$1" "$1-$(date +%s)"
}

function bakm() {
	mv "$1" "$1-$(date +%s)"
}

function lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
