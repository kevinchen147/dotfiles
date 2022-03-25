.PHONY: setup stow

all: setup stow

setup:
	sudo apt update \
	&& sudo apt upgrade -y \
	&& sudo apt install git git-lfs build-essential stow python3-distutils python3-venv -y \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

stow:
	git pull origin main && stow -v -R */