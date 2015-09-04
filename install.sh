#!/bin/sh

cp arch/arm/boot/zImage /media/$USER/boot
cp arch/arm/boot/dts/exynos5422-odroidxu3.dtb /media/$USER/boot
cp .config /media/$USER/boot/config-`make kernelrelease`
sudo rm -fr /media/$USER/rootfs/lib/modules/`make kernelrelease`
sudo make modules_install ARCH=arm INSTALL_MOD_PATH=/media/$USER/rootfs
sudo rm -fr /lib/modules/`make kernelrelease`
sudo ln -sf /media/$USER/rootfs/lib/modules/`make kernelrelease` /lib/modules/
sudo cp .config /boot/config-`make kernelrelease`
#sudo update-initramfs -c -k `make kernelrelease` -b ..
#mkimage -A arm -O linux -T ramdisk -C lzma -a 0 -e 0 -n uInitrd -d ../initrd.img-`make kernelrelease` ../uInitrd # /media/$USER/boot/uInitrd
