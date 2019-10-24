apt-get update && apt-get update &&\
apt-get install -y software-properties-common &&\
apt-get install -y autotools-dev automake cmake curl git wget zip build-essential gcc pkg-config net-tools

mkdir /home/user
sh -c "echo \"export HOME=/home/user\">> ~/.bashrc"
source ~/.bashrc

echo "Because we change HOME, we should souece  in /root/.bashrc"
# source /root/.bashrc
sh -c "echo \"alias sb='source /root/.bashrc'\" >> /root/.bashrc"
source /root/.bashrc

# install eos
wget https://github.com/EOSIO/eos/releases/download/v1.7.0/eosio_1.7.0-1-ubuntu-16.04_amd64.deb
apt -y install ./eosio_1.7.0-1-ubuntu-16.04_amd64.deb
wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.6.1/eosio.cdt_1.6.1-1_amd64.deb
apt -y install ./eosio.cdt_1.6.1-1_amd64.deb
mkdir contracts
cd contracts
git clone --recursive https://github.com/eosio/eosio.cdt --branch v1.6.1 --single-branch
cd eosio.cdt
./build.sh
./install.sh
