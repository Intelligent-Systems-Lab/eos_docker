apt-get update && \
apt-get install -y software-properties-common
apt-get install -y autotools-dev automake cmake curl git wget zip build-essential gcc pkg-config net-tools

mkdir /home/user
sh -c "echo \"export HOME=/home/user\">> ~/.bashrc"
source ~/.bashrc
