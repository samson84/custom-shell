#! /bin/bash
echo "Install APT dependencies"
apt-get update && apt-get install -y zsh curl git file

# echo "Install LSD"
# mkdir -p /opt/lsd
# curl --location https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd-0.23.1-i686-unknown-linux-musl.tar.gz | tar --extract --verbose --directory=/opt/lsd --gzip --strip-components=1 &&\
#     ln -s /opt/lsd/lsd /usr/bin/lsd
