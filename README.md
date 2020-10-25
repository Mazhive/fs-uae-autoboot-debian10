# fs-uae-autoboot-debian10
Auto boot straight into fs-uae on a debian preseed file and script to be used on the autoinstall
FS - uae on debian V2

Before we start .....

##################################################################################################
##												##
## SCRIPT :	Install fs-uae to boot from linux debian directly.				##	
##																##
##  		User need to make there own configuration in FS-UAE-launcher	##
##			Working FS-UAE, amiga FE OS4.1 configuration are available.	##
##			User is responsible for there own license of OS4.1			##
##			Licenses are available at http://www.amigaos.net/			##
##			The AmigaOS 4.1 Final Edition is being used	on a dedicated pc	##
##			for this script											##
##																##
## Requirements are:												##
##				 I personally highly recommend consider buying			##
##				 a license to support the development of the OS.4.1		##
##				it is possible to use the older amiga OS version or just		##
##				use the aros bios									##
##	!! making a working fs-uae configuration before installing the DEBIAN OS 	##
## to later transfer all configuration files to the "amiga" is highly recommended##
## 				this would speed up the setup and installation			##
##																##
##																##
##		Obvious : !! AmigaOS 4.1 Final Edition - http://www.amigaos.net/	##
##				!! FS-UAE V3.0.5 - https://fs-uae.net/ 					##
## !! debian-10.5.0-amd64-netinst.iso - a3ebc76aec372808ad80000108a2593a	##
##				!! a Fully functioning network with internet				##
##				!! some time ofcourse it takes a vm about about an hour	##
##				!! And some beginners knowledge of Linux				##
##  !!If you intend to use the OS4.1 the picasso IV must be set in order to work ##
##		!! a bios (PIV_FLAS.BIN) from the picasso grx card must be placed	##
##				manually and renamed into the roms folder				## 
##					(archive name PIV_FlashImage74.zip)				##
##				http://www.sophisticated-development.de/software/		##
##																##
##		since the DEBIAN NETinstall is being used there is a very limited	##
##				package download and installation.					##
##				I choose a lightdm with openbox installation.			##
##				The total amount approximately used space is 1.6 gig		##
##				Using it in a vm ,installation takes around 16 minutes.		##
##				It will only asks to enter your preferred root password in	##
##				the first 2 minutes.									##
##				After this user interaction,  it will install the os , 			##
##				configure the necessary settings and should boot in 		##
##				the Aros boot up screen asking for a boot medium		##
##				From here on you should copy your prepared fs-uae files 	##
##				from your ftp client to the "amiga"						##
##				Prep: fs-uae.cfg file									##
##				Make sure all links to paths are deleted you can import	##
##				the paths on your "amiga" using the fs-uae-launcher		## 		
##																##
## Running or booting up the system:									##
##																##
## 				Running it in a vm it will fire through the boot and login 	##
##				you never notice it and its bootup time is in a few seconds	##
##				Running it on a dedicated pc it will boot up in around 		##
##				1 and a half minute. (depending on the system)			##
##				Time is based on a dell optiplex 780					##
###################################################
###################################################
##	Be aware : 	If you are getting the following message while running	## 
##				"expected fs-uae version x.x.x got  x.x.x "				##
##				You need to update  this version to the latest version.		##
##																##
##		The easiest way, since you allready need a second "computer"		##
##		to copy your files /configs/plugins/cdees/images etc.(not included)	##
##		is using a ssh connection.									##
##																##
##			You can accomplish this by login in through the ssh.			##
##			and update it to the latest version of fs-uae (currently 3.0.5)	##
##			SSH-server should be ( and is...) installed in this preconfigured	##
##			install. 												##
##																##
##		    ----(sftp connection needed not necessary otherwise by terminal)	##
##			For ppc simulation (amigaos4.1) you NEED the ppc plugin.	 	##
##			These are available at https://fs-uae.net/download#plugins		##
##			This preconfigured install has a vsftp-server  installed and 		##
##			you can easily copy them in the right folder with 	filezilla		##
##			Available at https://filezilla-project.org/						##
##																##
##		   -----(ssh connection needed not necessary otherwise by terminal)	##
##			You probably want your own configuration file to be the first to	##
##			boot from, so by editing the /etc/xdg/openbox/autostart and set	##
##			it to your own configuration file using your preferred editor.		##
##																##
##																##
##																##
## todo :	blind all linux command lines to make it seem a real amiga		##
##			Optimize startup to boot it up even faster.					##
##			Some help in this matter is much appreciated				##
##																##
##			please consider donating, it toke me a lot of coffee and effort	##
##			So IF..... you want to buy me a coffee .....					##
##				https://www.paypal.com/paypalme/vanvoorn			##
##																##
###################################################
##		AUTHOR:  MAZHIVE PRODUCTIONS							##
###################################################
##																##
##		WARNING THIS SCRIPT IS ONLY INTENDED TO BE USED WITH 		##
##		ONLY ONE DEDICATED HARDDISK. PLEASE BE ADVISED IF THIS		##
##		IS NOT YOUR CASE.										##
##		I AM NOT RESPONSIBLE FOR DATA LOSS OR FAILURE OF YOUR PC	##
##																##
##		MNIMAL KNOWLEDGE OF LINUX IS ADVISED TO UNDERSTAND THE   ##
##		WAY IT WORKS											##
##																##
##		FS-UAE RUNS AS USER amiga  PASSWORD amiga					##
##		THE "AMIGA" CAN BE ACCESSED BY FTP OVER TLS  ,				##
##	   TO TRANSFER YOUR EXISTING FS-UAE FILES TO THE FS-UAE FOLDER	##
##																##
##	   RUNNING AS THE USER DURING USE IS HIGHLY PREFERABLE			##
##	   RUNNING IT IN A VM WITH A HD OF ABOUT 80GIG SHOULD BE ENOUGH	##
##																##
##																##
##																##
##																##
###################################################


all lines starting with % and between ( ) are comments 
the rest are inputs and need to be typed , entered changed or checked.

debian-10.5.0-amd64-netinst.iso - a3ebc76aec372808ad80000108a2593a
%insert your cdrom/ iso or image
%you'll be presented to install debian use the advanced option
%
%use the automated installation 
%
%and fill in this short url

https://bit.ly/3jnsLU0

%or original 

https://raw.githubusercontent.com/Mazhive/fs-uae-autoboot-debian10/master/preseed.cfg

