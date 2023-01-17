.PHONY: *

debian:
	sudo apt update \
	&& sudo apt upgrade -y \
	&& sudo apt install git git-lfs build-essential stow \
	python3-distutils python3-venv -y \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

arch:
	sudo pacman -S base-devel stow gnupg noto-fonts noto-fonts-cjk dmenu \
	i3 unzip neovim dunst python task openssh keybase keybase-gui kbfs \
	xorg xorg-xinit firefox ibus-rime clang alacritty xclip pulseaudio \
	pavucontrol kdeconnect rime-double-pinyin rime-emoji noto-fonts-emoji \
	nodejs npm rust ripgrep fd

cli:
	stow -t ~ -v -S git/ ssh/ vim/ pip/ npm/ task/ nvim/ tmux/ zsh/

lsp:
	sudo pacman -S lua-language-server
	sudo npm i -g pyright markdownlint-cli
	python -m pip install autopep8
	cargo install stylua

algo:
	python -m pip install sortedcontainers

gui:
	stow -t ~ -v -S i3/ x/ alacritty/ ibus/
	sudo stow -t /etc/X11/xorg.conf.d/ -v -S x11/

ibus-load:
	dconf load /desktop/ibus/ < ./ibus/.config/ibus/ibus.dconf

ibus-dump:
	dconf dump /desktop/ibus/ > ./ibus/.config/ibus/ibus.dconf
