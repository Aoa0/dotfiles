# ls aliases are defined in oh-my-zsh
# alias lsa='ls -lah'
# alias l='ls -lah'
# alias ll='ls -lh'
# alias la='ls -lAh'

# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# cd to git root directory
alias cdgr='cd "$(git rev-parse --show-toplevel)"'

