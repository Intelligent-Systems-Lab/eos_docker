FROM ubuntu:16.04
  
RUN apt-get update && apt-get install -y openssh-server


RUN apt-get update && apt-get -y upgrade &&\
    apt-get install -y apt-utils openssh-server software-properties-common &&\
    apt-get install -y autotools-dev automake curl git wget zip build-essential gcc pkg-config net-tools nano

RUN apt-get install -y gdb

#RUN mkdir /var/run/sshd
RUN echo 'root:eospc' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config &&\
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
  
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
  
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN service ssh restart
  
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

ENV eos_path=/root/eos_build
RUN mkdir -p $eos_path

# install cmake 3.12.0
RUN wget https://github.com/Kitware/CMake/releases/download/v3.12.0/cmake-3.12.0.tar.gz &&\
    tar zxvf cmake-3.12.0.tar.gz &&\
    cd cmake-3.12.0 &&\
    ./bootstrap &&\
    make -j8 &&\
    make install &&\
    cd / &&\
    rm -r cmake-3.12.0.tar.gz cmake-3.12.0 &&\
    cmake --version

RUN cd $eos_path &&\
    wget https://github.com/EOSIO/eos/releases/download/v2.0.0/eosio_2.0.0-1-ubuntu-16.04_amd64.deb &&\
    apt -y install ./eosio_2.0.0-1-ubuntu-16.04_amd64.deb &&\
    rm -r eosio_2.0.0-1-ubuntu-16.04_amd64.deb
    #wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.6.1/eosio.cdt_1.6.1-1_amd64.deb &&\
    #apt -y install ./eosio.cdt_1.6.1-1_amd64.deb

# RUN cd $eos_path &&\
#     git clone --recursive https://github.com/EOSIO/eosio.cdt.git --branch v1.6.3 --single-branch &&\
#     cd eosio.cdt &&\
#     mkdir build &&\
#     cd build &&\
#     cmake .. &&\
#     make -j8 &&\
#     make install
RUN cd $eos_path &&\
    mkdir contracts &&\
    cd contracts &&\
    git clone --recursive https://github.com/eosio/eosio.cdt --branch v1.6.1 --single-branch &&\
    cd eosio.cdt &&\
    ./build.sh &&\
    ./install.sh &&\
    cd $eos_path/contracts &&\
    rm -r eosio.cdt

# https://github.com/cdr/code-serve
EXPOSE 8080
ENV PASSWORD=eospc

RUN apt install curl &&\
    wget https://github.com/cdr/code-server/releases/download/2.1688-vsc1.39.2/code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz &&\
    tar zxvf code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz &&\
    rm -r code-server2.1688-vsc1.39.2-linux-x86_64.tar.gz

#https://github.com/ml-tooling/ml-workspace/blob/develop/Dockerfile#L930
RUN \
    # Make zsh the default shell
    chsh -s $(which bash) root

# setting code-server default to bash and resize font
RUN mkdir -p /root/.local/share/code-server/User &&\
    touch /root/.local/share/code-server/User/settings.json &&\
    echo '{"editor.fontSize": 18,"terminal.integrated.fontSize": 16,"terminal.integrated.shell.linux": "/bin/bash",}' >> /root/.local/share/code-server/User/settings.json
# run code server   
ENTRYPOINT ./code-server2.1688-vsc1.39.2-linux-x86_64/code-server >> codeserver.txt
