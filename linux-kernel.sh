#!/bin/bash
##Only for debian systems!!

wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.1.tar.xz
tar xvf linux-6.1.tar.xz
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
cd linux-6.0.7
cp -v /boot/config-$(uname -r) .config
make menuconfig
make
sudo make install
sudo update-initramfs -c -k 6.0.7
sudo update-grub
sudo reboot
uname -mrs