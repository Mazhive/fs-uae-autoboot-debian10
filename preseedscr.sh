#!/bin/sh
# Complementary script

echo "script is opgestart $(date +%x_%X)" > /home/amiga/done
echo "deb [trusted=yes] https://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/Debian_10/ /" > /etc/apt/sources.list.d/FrodeSolheim-stable.list

# set maximum performance
sed -i 's/^GOVERNOR=.*/GOVERNOR="performance"/' /etc/init.d/cpufrequtils

mkdir /home/amiga/ftp
chown nobody:nogroup /home/amiga/ftp
chmod a-w /home/amiga/ftp
mkdir /home/amiga/ftp/files
chown amiga:amiga /home/amiga/ftp/files
echo "vsftpd test file" | tee /home/amiga/ftp/files/test.txt

# alteration config file to work with ftp over tls

sed -i '/#write_enable=YES/c\write_enable=YES' /etc/vsftpd.conf
sed -i '/#chroot_local_user=YES/c\chroot_local_user=YES' /etc/vsftpd.conf
sed -i '$auser_sub_token=amiga' /etc/vsftpd.conf
sed -i '$alocal_root=/home/amiga/ftp' /etc/vsftpd.conf
sed -i '$apasv_min_port=40000' /etc/vsftpd.conf
sed -i '$apasv_max_port=50000' /etc/vsftpd.conf
sed -i '$auserlist_enable=YES' /etc/vsftpd.conf
sed -i '$auserlist_file=/etc/vsftpd.userlist' /etc/vsftpd.conf
sed -i '$auserlist_deny=NO' /etc/vsftpd.conf
sed -i '$assl_tlsv1=YES' /etc/vsftpd.conf
sed -i '$assl_sslv2=NO' /etc/vsftpd.conf
sed -i '$assl_sslv3=NO' /etc/vsftpd.conf
echo "amiga" | tee -a /etc/vsftpd.userlist

#### change lightdm to autologin
sed -i '/#autologin-user=/c\autologin-user=amiga' /etc/lightdm/lightdm.conf
sed -i '/#autologin-user-timeout=0/c\autologin-user-timeout=0' /etc/lightdm/lightdm.conf


# grub change

sed -i '/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/c\GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"' /etc/default/grub
sed -i '/GRUB_TIMEOUT=5/c\GRUB_TIMEOUT=0' /etc/default/grub
sed -i '/GRUB_TIMEOUT=.*/a GRUB_GFXMODE=1280x1024x32' /etc/default/grub

update-grub

#  enable ufw on boot and set variables

#systemctl enable ufw
ln -s /lib/systemd/system/ufw.service /etc/systemd/system/multi-user.target.wants/ufw.service /lib/systemd/systemd-sysv-install enable ufw

# autostart fs-uae openbox
sed -i '$afs-uae --fullscreen=1' /etc/xdg/openbox/autostart

# start up with xsession
#
#fs-uae --fullscreen=1
#echo "#!/bin/sh" | tee -a /etc/X11/Xsession.d/startup-local
#echo "fs-uae --fullscreen=1" | tee -a /etc/X11/Xsession.d/startup-local
ufw enable
apt update
apt upgrade -y
################
# Plymouth amiga splash boot
#
 wget https://github.com/Mazhive/fs-uae-autoboot-debian10/raw/master/amigaplymouth.tar.gz
 tar -xzvf amigaplymouth.tar.gz -C /
 rm amigaplymouth.tar.gz
#
#
#
#
#
 update-initramfs -c -k all
################################




#ufw enable
#/lib/ufw/ufw-init start
#/usr/sbin/ufw allow 20/tcp
#/usr/sbin/ufw allow 21/tcp
#/usr/sbin/ufw allow 990/tcp
#/user/sbinufw allow 40000:50000/tcp
#/usr/sbin/ufw allow ssh
#/usr/sbin/ufw allow 22


echo "script is beeindigd $(date +%x_%X)" >> /home/amiga/done
