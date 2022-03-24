# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Check if a file contains non-ascii characters
nonascii() {
    LC_ALL=C grep -n '[^[:print:][:space:]]' "${1}"
}

backup_gitignore() {
    if [ -f ~/.gdbinit ] || [ -h ~/.gdbinit ]; then
        echo "backing up gdbinit file"
        mv ~/.gdbinit ~/.gdbinit.bak
    fi
}

use_pwndbg() {
    backup_gitignore
    cd ~/.dotfiles/tools/pwndbg
    ./setup.sh
}

use_gef() {
    backup_gitignore
    echo "source ~/.dotfiles/tools/gef/gef.py" >> ~/.gdbinit
}