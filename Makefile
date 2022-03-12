.PHONY: stow setup path abbr

FISH := /usr/bin/fish

stow:
	git pull origin main && stow -v -R */

abbr:
	$(FISH) -c "abbr --add - 'cd -' \
	&& abbr --add .. 'cd ..' \
	&& abbr --add ... 'cd ../..' \
	&& abbr --add .... 'cd ../../..' \
	&& abbr --add _ 'sudo' \
	&& abbr --add c 'code' \
	&& abbr --add d 'sudo docker' \
	&& abbr --add g 'git' \
	&& abbr --add l 'less' \
	&& abbr --add m 'make' \
	&& abbr --add py 'python3'"

path:
	$(FISH) -c "fish_add_path -m '$(HOME)/.local/bin/'"

setup:
	sudo apt update \
	&& sudo apt upgrade \
	&& sudo apt -y install git git-lfs build-essential stow python3-distutils python3-venv \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install
