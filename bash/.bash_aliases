alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias _="sudo"
alias c="code"
alias d="sudo docker"
alias g="git"
alias l='less'
alias ll='ls -alF --color=always'
alias ls='ls -hF --color=always'
alias m="make"
alias o="xdg-open"
alias py="python3"
alias r="ranger"

alias on="export {http,https}_proxy=127.0.0.1:7777"
alias off="export {http,https}_proxy="

alias vpn="cd /etc/openvpn && sudo openvpn --script-security 2 --config /etc/openvpn/client.ovpn --auth-user-pass /etc/openvpn/auth"
alias nfs="sudo mount -t nfs4 192.168.131.186:/ ~/nfs/"

function - {
    cd -;
}