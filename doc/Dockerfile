FROM ubuntu:16.04
  
RUN apt-get update && apt-get install -y openssh-server


RUN apt-get update && apt-get -y upgrade &&\
    apt-get install -y apt-utils openssh-server software-properties-common &&\
    apt-get install -y autotools-dev automake cmake curl git wget zip build-essential gcc pkg-config net-tools nano

RUN mkdir /var/run/sshd
RUN echo 'root:eospc' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
  
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
  
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
  
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

ENV eos_path=/root/eos_build
RUN mkdir -p $eos_path

RUN cd $eos_path &&\
    wget https://github.com/EOSIO/eos/releases/download/v1.8.6/eosio_1.8.6-1-ubuntu-16.04_amd64.deb &&\
    apt -y install ./eosio_1.8.6-1-ubuntu-16.04_amd64.deb &&\
    wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.6.1/eosio.cdt_1.6.1-1_amd64.deb &&\
    apt -y install ./eosio.cdt_1.6.1-1_amd64.deb

RUN cd $eos_path &&\
    mkdir contracts &&\
    cd contracts &&\
    git clone --recursive https://github.com/eosio/eosio.cdt --branch v1.6.1 --single-branch &&\
    cd eosio.cdt &&\
    ./build.sh &&\
    ./install.sh

# https://github.com/cdr/code-serve
EXPOSE 8080
ENV PASSWORD=eospc

RUN apt install curl &&\
    wget https://github.com/cdr/code-server/releases/download/2.1688-vsc1.39.2/code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz &&\
    tar zxvf code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz

#RUN touch codeserver.txt
    
#ENTRYPOINT ./code-server2.1688-vsc1.39.2-linux-x86_64/code-server >> codeserver.txt

#RUN cat codeserver.txt











