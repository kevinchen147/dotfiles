.PHONY: debian arch cli gui code

debian:
	sudo apt update \
	&& sudo apt upgrade -y \
	&& sudo apt install git git-lfs build-essential stow python3-distutils \
	python3-venv -y \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

arch:
	sudo pacman -S base-devel stow gnupg noto-fonts noto-fonts-cjk dmenu i3 \
	unzip neovim dunst python task openssh keybase keybase-gui kbfs xorg \
	xorg-xinit firefox code ibus-rime clang nodejs npm

cli:
	stow -t ~ -v -S bash/ git/ ssh/ vim/ pip/ npm/ task/ nvim/

gui:
	stow -t ~ -v -S i3/ x/ code/ alacritty/ ibus/

code:
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension Lencerf.beancount
	code --install-extension ms-pyright.pyright
	code --install-extension vscodevim.vim
	# code --install-extension ms-vscode.cpptools
