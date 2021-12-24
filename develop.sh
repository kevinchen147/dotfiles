# +-------------+
# | Development |
# +-------------+
sudo apt update \
&& sudo apt -y install git git-lfs build-essential make g++ python3-pip code \
&& sudo apt autoremove -y && apt clean -y \
&& git lfs install \
&& python3 -m pip install --no-cache-dir requests sortedcontainers pylint black --user