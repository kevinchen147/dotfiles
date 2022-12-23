alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias _="sudo"
alias c="code"
alias d="sudo docker"
alias g="git"
alias l="less"
alias ll="ls -alFh --color=auto"
alias ls="ls -aF --color=auto"
alias m="make"
alias o="xdg-open"
alias p="sudo pacman"
alias py="python"
alias r="ranger"
alias s="sudo systemctl"
alias t="task"

alias on="export {http,https}_proxy=127.0.0.1:6666"
alias off="export {http,https}_proxy="

alias vpn="cd /etc/openvpn && sudo openvpn --script-security 2 --config /etc/openvpn/client.ovpn --auth-user-pass /etc/openvpn/auth"
alias nfs="sudo mount -t nfs4 192.168.131.186:/ ~/nfs/"

function - {
    cd -;
}
