# Mount USB Drive

mkdir -p /media/usbhdd
chmod -R o+w /media/usbhdd
echo "/dev/sda1 /media/usbhdd ext2 rw,suid,dev,exec,auto,user,async,gid=pi,uid=pi 0 0" >> /etc/fstab
gpasswd -a pi disk
mount /dev/sda1 /media/usbhdd