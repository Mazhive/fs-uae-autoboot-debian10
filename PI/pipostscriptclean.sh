#!/bin/bash
# Complementary script specific pi.

#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

apt update
echo creating user
useradd -m -p $(openssl passwd -1 amiga) -s /bin/bash -G sudo amiga

echo "script is opgestart $(date +%x_%X)" > /home/amiga/done
echo "deb [trusted=yes] https://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/Debian_10/ /" > /etc/apt/sources.list.d/FrodeSolheim-stable.list

apt install vsftpd ufw openssh-server xorg wget gnupg2 mesa-utils cpufrequtils sysfsutils plymouth plymouth-themes lightdm openbox fs-uae fs-uae-launcher fs-uae-arcade -y

echo set performance
# set maximum performance
sed -i 's/^GOVERNOR=.*/GOVERNOR="performance"/' /etc/init.d/cpufrequtils

mkdir /home/amiga/ftp
chown nobody:nogroup /home/amiga/ftp
chmod a-w /home/amiga/ftp
mkdir /home/amiga/ftp/files
mkdir /home/amiga/.config/openbox/
chown amiga:amiga /home/amiga/.config/openbox
chown amiga:amiga /home/amiga/ftp/files
echo "vsftpd test file" | tee /home/amiga/ftp/files/test.txt

echo alteration config file to work with ftp over tls

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

echo change lightdm to autologin

sed -i '/#autologin-user=/c\autologin-user=amiga' /etc/lightdm/lightdm.conf
sed -i '/#autologin-user-timeout=0/c\autologin-user-timeout=0' /etc/lightdm/lightdm.conf
sed -i '/autologin-user=pi/c\autologin-user=amiga'

#systemctl enable ufw

ln -s /lib/systemd/system/ufw.service /etc/systemd/system/multi-user.target.wants/ufw.service 

/lib/systemd/systemd-sysv-install enable ufw

# autostart fs-uae openbox

sed -i '/@lxpanel --profile LXDE-pi/c\#@lxpanel --profile LXDE-pi'/etc/xdg/lxsession/LXDE-pi/autostart 
sed -i '/@pcmanfm --desktop --profile LXDE-pi/c\#@pcmanfm --desktop --profile LXDE-pi'/etc/xdg/lxsession/LXDE-pi/autostart
sed -i '/@#@xscreensaver -no-splash/c\#@xscreensaver -no-splash'/etc/xdg/lxsession/LXDE-pi/autostart

sed -i '$afs-uae --fullscreen=1' /etc/xdg/lxsession/LXDE-pi/autostart

sed -i '/. /etc/X11/Xsession/c\#. /etc/X11/Xsession' /etc/X11/xinit/xinitrc
sed -i '$exec openbox-session'


systemctl enable ufw

apt update
apt upgrade -y

################
# Plymouth amiga splash boot
#

wget https://github.com/Mazhive/fs-uae-autoboot-debian10/raw/master/amigaplymouth.tar.gz
tar -xzvf amigaplymouth.tar.gz -C /
cp /usr/share/plymouth/themes/futureprototype/plymouth_background_future.png /usr/share/plymouth/themes/pix/splash.png
rm amigaplymouth.tar.gz

cp /usr/share/plymouth/themes/debian-theme/plymouth_background_future.png /usr/share/rpd-wallpaper/amiga.png

sed -i '/temple.jpg/c\wallpaper=/usr/share/rpd-wallpaper/amiga.png' /etc/lightdm/pi-greeter.conf
sed -i '/crop/c\wallpaper_mode=stretch' /etc/lightdm/pi-greeter.conf
sed -i '/raspberry-pi-logo.png/c\default-user-image=/usr/share/plymouth/themes/futureprototype/logo.png' /etc/lightdm/pi-greeter.conf


#
#
#####

################
echo  boot Clean up

sed -i '/message_sprite = Sprite();/c\#message_sprite = Sprite();' /usr/share/plymouth/themes/pix/pix.script
sed -i '/message_sprite.SetPosition(screen_width * 0.1, screen_height * 0.9, 10000);/c\#message_sprite.SetPosition(screen_width * 0.1, screen_height * 0.9, 10000);' /usr/share/plymouth/themes/pix/pix.script
sed -i '/my_image = Image.Text(text, 1, 1, 1);/c\#my_image = Image.Text(text, 1, 1, 1);' /usr/share/plymouth/themes/pix/pix.script
sed -i '/message_sprite.SetImage(my_image);/c\#message_sprite.SetImage(my_image);' /usr/share/plymouth/themes/pix/pix.script

sed -i 's/-consoles *$/-consoles logo.nologo vt.global_cursor_default=0/g' /boot/cmdline.txt
###
echo installl plugins

wget https://fs-uae.net/files/plugins/FS-UAE-Plugins_2019-05-29.zip
unzip FS-UAE-Plugins_2019-05-29.zip -d /home/amiga/Documents/FS-UAE/Plugins/
rm FS-UAE-Plugins_2019-05-29.zip




ufw allow 21
ufw allow 22

