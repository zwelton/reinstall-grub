#!/bin/bash


# how to use:
# sudo -s
# fdisk -l
# find partition filesystem (sda2 for example)
# find partition boot (sda1 for example)

echo start
echo mount
mount /dev/sda2 /mnt
# sda 2 for example
mount --bind /dev/ /mnt/dev
mount --bind /proc/ /mnt/proc
mount --bind /sys/ /mnt/sys
mount --bind /sys/firmware/efi/efivars/ /mnt/sys/firmware/efi/efivars
mount -o rw /dev/sda1 /mnt/boot/efi
# sda1 for example
mount --bind /run/ /mnt/hostrun/
chroot /mnt/
mkdir /run/lvm
mount --bind /hostrun/lvm/ /run/lvm/
grub-install /dev/sda
update-grub
exit
sleep 1
echo umount
umount /mnt/dev
umount /mnt/proc
umount /mnt/sys/firmware/efi/efivars
umount /mnt/sys
umount /mnt/boot/efi
umount /mnt/hostrun
umount /mnt/run/lvm
umount /mnt
echo done
