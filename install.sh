# +-------------+
# | Development |
# +-------------+
sudo apt update \
&& sudo apt -y install git git-lfs build-essential make stow \
&& sudo apt autoremove -y && sudo apt clean -y \
&& git lfs install \
&& python3 -m pip install --no-cache-dir requests sortedcontainers --user
