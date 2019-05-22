#!/bin/bash


sudo yum -y install protobuf-devel.x86_64 zlib-devel gcc-c++ ncurses-devel.x86_64 openssl-devel x86_64

(
cd "$(mktemp -d)"
wget https://mosh.org/mosh-1.3.2.tar.gz && tar -zxvf mosh-1.3.2.tar.gz && cd mosh-1.3.2
./configure
make
sudo make install
)
