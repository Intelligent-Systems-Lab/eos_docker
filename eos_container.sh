apt-get update && \
apt-get install -y software-properties-common
apt-get install -y autotools-dev automake cmake curl git wget zip build-essential gcc pkg-config net-tools

mkdir /home/user
sh -c "echo \"export HOME=/home/user\">> ~/.bashrc"
source ~/.bashrc

echo "Because we change $HOME, we should souece  in /root/.bashrc"
# source /root/.bashrc
sh -c "echo \"alias sb='source /root/.bashrc'\" >> /root/.bashrc"
source /root/.bashrc
