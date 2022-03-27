.PHONY: debian arch cli gui

debian:
	sudo apt update \
	&& sudo apt upgrade -y \
	&& sudo apt install git git-lfs build-essential stow python3-distutils python3-venv -y \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

arch:
	sudo pacman -Sy git-lfs base-devel stow gnupg noto-fonts \
	&& git lfs install

cli:
	git pull origin main && stow -v -R bash/ git/ ssh/

gui:
	git pull origin main && stow -v -R i3/ x/
