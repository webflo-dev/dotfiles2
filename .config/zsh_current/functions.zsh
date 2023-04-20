
function mkcd() {
   mkdir -p "$@" && cd "$_";
}

function bak() {
	cp -r "$1" "$1-$(date +%s)"
}

function bakm() {
	mv "$1" "$1-$(date +%s)"
}
