# +-----+
# | Vim |
# +-----+
EDITOR=vim
set -o vi
set -o physical

# +-------+
# | Alias |
# +-------+
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias _="sudo"
alias c="code"
alias d="sudo docker"
alias g="git"
alias l='ls -alF --color=always'
alias ls='ls -hF --color=always'
alias o="explorer.exe"
alias py="python3"
alias v="vim"
alias m="make"

alias on="gsettings set org.gnome.system.proxy mode manual"
alias off="gsettings set org.gnome.system.proxy mode none"

function - {
    cd -;
}

# +--------+
# | Prompt |
# +--------+
GIT() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/<\1>/'
}
GREEN='\[\033[01;32m\]'
PURPLE='\[\033[01;35m\]'
CYAN='\[\033[01;36m\]'
BLACK='\[\033[00m\]'
BLUE='\[\033[01;34m\]'
RED='\[\e[91m\]'
PS1="${debian_chroot:+($debian_chroot)}${CYAN}\w${RED} \$(GIT)${BLACK}\n\$ "
