.PHONY: stow setup fish path greeting abbr

FISH := /usr/bin/fish

all: fish setup stow

fish: path greeting abbr

path:
	$(FISH) -c "fish_add_path -m '$(HOME)/.local/bin/'"

greeting:
	$(FISH) -c "set -gx fish_greeting"

abbr:
	$(FISH) -c "abbr --add - 'cd -' \
    && abbr --add .. 'cd ..' \
    && abbr --add ... 'cd ../..' \
    && abbr --add .... 'cd ../../..' \
    && abbr --add _ 'sudo' \
    && abbr --add c 'code' \
    && abbr --add d 'sudo docker' \
    && abbr --add g 'git' \
    && abbr --add m 'make' \
    && abbr --add o 'explorer.exe' \
    && abbr --add py 'python3'"

setup:
	sudo apt update \
	&& sudo apt upgrade \
	&& sudo apt -y install git git-lfs build-essential stow python3-distutils python3-venv \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

stow:
	git pull origin main && stow -v -R */
