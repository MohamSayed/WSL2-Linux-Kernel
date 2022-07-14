#!/bin/sh

KERNE_BUILD_DATE=$(date +"%s")

echo "* copying kernel to windows"
cp arch/x86/boot/bzImage /mnt/c/wslkernel5/kernel-$KERNE_BUILD_DATE
echo "* done!"

echo "* renaming .wslconfig file"
sed -i 's/\\kernel-.*/\\kernel-'$KERNE_BUILD_DATE'/g' /mnt/c/Users/moham/.wslconfig
echo "* done!"

echo "* installing modules to the distro"
make modules_install
echo "* done!"
