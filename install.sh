cat $(pwd)/boot/boot.img.xz | unxz | dd of=$1 bs=1M
/bin/echo -e "d\n2\nn\np\n2\n143360\n\nw\n" | fdisk $1
mkfs.ext4 -O ^has_journal -b 4096 ${1}2
mount ${1}2 /mnt
mkdir /mnt/boot
mount ${1}1 /mnt/boot
/bin/echo 'copy linux system'
cat $2 | tar --numeric-owner -C /mnt -xpJf -
cp -r $(pwd)/rootfs/* /mnt/
/bin/echo 'upgrade linux kernel'
rm -r -f /mnt/boot/*
cat $(pwd)/kernel/kernel.tar.xz | sudo tar --numeric-owner -C /mnt -xpJf -
mv /mnt/boot/uEnv.txt.in /mnt/boot/uEnv.txt
rm -rf /mnt/home/*
umount /mnt/boot; sudo umount /mnt;
sync; sync
