sudo apt update \
&& sudo apt -y install git git-lfs build-essential make g++ python3-pip \
&& sudo apt autoremove -y && sudo apt clean -y \
&& git lfs install
