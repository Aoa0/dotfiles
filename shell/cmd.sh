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

backup_gdbinit() {
    if [ -f ~/.gdbinit ] || [ -h ~/.gdbinit ]; then
        echo "backing up gdbinit file"
        mv ~/.gdbinit ~/.gdbinit.bak
    fi
}

use_pwndbg() {
    backup_gdbinit
    cd ~/.dotfiles/tools/pwndbg
    ./setup.sh
}

use_gef() {
    backup_gdbinit
    echo "source ~/.dotfiles/tools/gef/gef.py" >> ~/.gdbinit
}

# Serve current directory
serve() {
    python3 -m http.server
}

set_wsl_proxy() {
    hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
    port=${ssport:-1080}
    export all_proxy="socks5://${hostip}:${port}"
}

unset_proxy() {
    unset all_proxy
}

