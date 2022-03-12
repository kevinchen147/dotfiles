.PHONY: setup stow abbr

all: setup stow abbr

setup:
	sudo apt update \
	&& sudo apt upgrade \
	&& sudo apt -y install git git-lfs build-essential stow python3-distutils python3-venv \
	&& sudo apt autoremove -y && sudo apt clean -y \
	&& git lfs install

stow:
	git pull origin main && stow -v -R */

abbr:
	/usr/bin/fish -c "abbr --add - 'cd -' \
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