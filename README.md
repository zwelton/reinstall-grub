# reinstall-grub
automatic reinstall grub

how to use:
start linux in live mode

command:
sudo -s
fdisk -l

find partition filesystem
find partition boot

edit grub.sh

later:
sudo -s
./grub.sh

if necessary:
chmod +x grub.sh

# tested in kali linux
