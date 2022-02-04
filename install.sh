# +-------------+
# | Development |
# +-------------+
sudo apt update \
&& sudo apt upgrade \
&& sudo apt -y install git git-lfs build-essential stow python3-distutils \
&& sudo apt autoremove -y && sudo apt clean -y \
&& git lfs install

# +--------+
# | Python |
# +--------+
python3 -m pip install --no-cache-dir requests sortedcontainers --user
