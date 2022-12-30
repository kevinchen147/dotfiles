.PHONY: debian arch cli gui code

debian:
	sudo apt update \
	&& sudo apt upgrade -y \
	&& sudo apt install git git-lfs build-essential stow python3-distutils python3-venv -y \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

arch:
	sudo pacman -S base-devel stow gnupg noto-fonts noto-fonts-cjk dmenu i3 unzip vim dunst python

cli:
	# sudo pacman -S task openssh keybase keybase-gui kbfs
	stow -v -R bash/ git/ ssh/ vim/ pip/ npm/ ibus/ task/

gui:
	# sudo pacman -S xorg xorg-xinit firefox code ibus-rime
	stow -v -R i3/ x/ code/ alacritty/

code:
	code --install-extension DavidAnson.vscode-markdownlint
	code --install-extension Lencerf.beancount
	code --install-extension ms-pyright.pyright
	code --install-extension vscodevim.vim
	# code --install-extension ms-vscode.cpptools