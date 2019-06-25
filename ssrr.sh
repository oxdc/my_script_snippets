printf '\n\n========= update and install package =========\n\n'
apt update && apt upgrade -y
apt install -y git python python3 vim build-essential wget

printf '\n\n======== download and initialize ssrr ========\n\n'
cd ~
mkdir softwares
cd ~/softwares
git clone -b manyuser https://github.com/shadowsocksrr/shadowsocksr.git
cd ~/softwares/shadowsocksr
bash initcfg.sh

printf '\n\n======= download and install libsodium  ======\n\n'
cd ~/softwares
wget https://github.com/jedisct1/libsodium/releases/download/1.0.17/libsodium-1.0.17.tar.gz
tar xf libsodium-1.0.17.tar.gz && cd libsodium-1.0.17
./configure && make -j2 && make install
ldconfig

printf '\n\n=============== configuration ================\n\n'
cd ~/softwares/shadowsocksr/shadowsocks
read -p 'Server-side Port: ' SERVER_PORT
read -p 'Encryption Method: ' ENCRYPTION_METHOD
read -p 'Protocol: ' PROTOCOL
read -p 'Obfs: ' OBFS
read -sp 'Password: ' PASSWORD

printf '\n\n================ start ssrr =================\n\n'
python server.py -p $SERVER_PORT -k $PASSWORD -m $ENCRYPTION_METHOD -O $PROTOCOL -o $OBFS -d start

printf '\n\n=================== done ====================\n\n'
