# proxy
export {http,https}_proxy="http://127.0.0.1:6666"

# private bin
export PATH=$HOME/.local/bin:$PATH

# tex
export PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH

# golang
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# rust
export PATH=$HOME/.cargo/bin:$PATH

# xdg
export XDG_CONFIG_HOME=${HOME}/.config

# nvim
export VISUAL=nvim
export EDITOR=nvim
export VI_MODE_SET_CURSOR=true

# pass
export PASSWORD_STORE_DIR=$HOME/projects/pass
