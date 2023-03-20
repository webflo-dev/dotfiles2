function mkcd() {
   mkdir -p "$@" && cd "$_";
}

# Search text in file content
function find-in-files() {
    grep -rnw --exclude-dir={.git,node_modules,coverage,__snapshots__,migrations,venv,bower_components} . -e $1;
}

function bak() {
	cp -r "$1" "$1-$(date +%s)"
}
#---------------------------------------------------------------------------
