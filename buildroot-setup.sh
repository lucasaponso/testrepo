#!/bin/bash

git clone https://git.buildroot.net/buildroot
make nitrogen6x_defconfig
curl https://storage.googleapis.com/boundarydevices.com/20151201-buildroot-nitrogen6x.config > .config
make
sudo parted /dev/sdc mklabel msdos
sudo parted -a optimal /dev/sdc mkpart primary 0% 100%
zcat output/images/rootfs.ext2.gz | sudo dd of=/dev/sdc1 bs=1M