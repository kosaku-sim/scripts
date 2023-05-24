#!/bin/sh
sudo su -
useradd -m $1
usermod -aG wheel $1
su - $1
cd
mkdir .ssh
curl https://github.com/$1.keys > .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
