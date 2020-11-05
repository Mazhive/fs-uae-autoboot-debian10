##############################################################################################
## I / we are by no means affiliated by commodore / amiga  hyperion /boingball and are soly ##
## having the purpose to use the material as a enthousiastic for amiga.			    ##
## And doing this for educational purpose , This information is only provided as a	    ##
## convenience to the users and have a smoother overall experience.			    ##
##                                                                                          ##
##############################################################################################


		
 SCRIPT and Preseed file:	Install fs-uae to boot from linux debian directly.					
																
		User need to make there own configuration in FS-UAE-launcher	
			Working FS-UAE, amiga FE OS4.1 configuration are available.	
			User is responsible for there own license of OS4.1			
			Licenses are available at http://www.amigaos.net/			
			The AmigaOS 4.1 Final Edition is being used on a dedicated pc	
			for testing purposes.										
																
 Requirements notes:												
			I personally highly recommend consider buying			
			a license to support the development of the OS.4.1		
			it is possible to use the older amiga OS version or just		
			use the aros bios									
			
			!! making a working fs-uae configuration before installing the DEBIAN OS 
			
			to later transfer all configuration files to the "amiga" is highly recommended
			this would speed up the setup after the installation.			
 Requirements are:																
																
	 Obvious : !! AmigaOS 4.1 Final Edition - http://www.amigaos.net/	

		   !! debian-10.5.0-amd64-netinst.iso - a3ebc76aec372808ad80000108a2593a	

		   !! a Fully functioning network with internet				
		   
		   !! some time ofcourse it takes a vm about about 30 minutes	
		   
		   !! And some beginners knowledge of Linux				
			
		   !!If you intend to use the OS4.1 the picasso IV must be set in order to work 

		   !! a bios (PIV_FLAS.BIN) from the picasso grx card must be placed	
				manually and renamed into the roms folder				 
					(archive name PIV_FlashImage74.zip)				
				http://www.sophisticated-development.de/software/		
																
		since the DEBIAN NETinstall is being used there is a very limited	
				package download and installation.					
				I choose a lightdm with openbox installation.			
				The total amount approximately used space is 1.6 gig		
				Using it in a vm ,installation takes around 30 minutes.		
				It will only asks to enter your preferred root password in	
				the first 2 minutes.									
				After this user interaction,  it will install the os ,			
				configure the necessary settings and should boot in		
				the Aros boot up screen asking for a boot medium		
				From here on you should copy your prepared fs-uae files	
				from your ftp client to the "amiga"						
		Prep: fs-uae.cfg files.								
				Make sure all links to paths are deleted you can import	
				the paths on your "amiga" using the fs-uae-launcher	
																
 Running or booting up the system:									
																
				Running it in a vm it will fire through the boot and login	
				you never notice it and its bootup time is in a few seconds	
				Running it on a dedicated pc it will boot up in around		
				1 and a half minute. (depending on the system)			
				Time is based on a dell optiplex 780					


	Be aware :	If you are getting the following message while running	 
				"expected fs-uae version x.x.x got  x.x.x "				
				You need to update  this version to the latest version.		
																
		The easiest way, since you allready need a second "computer"		
		to copy your files /configs/plugins/cdees/images etc.(not included)	
		is using a sftp connection. The sftp server is allready installed and can be easily
		reached with Filezilla (using the same username and password)									
																
			SSH-server should be ( and is...) installed in this preconfigured	
			install.												
												
			For ppc simulation (amigaos4.1) you NEED the ppc plugin.
		
			These are available at https://fs-uae.net/download#plugins		
			This preconfigured install has a vsftp-server  installed and		
			you can easily copy them in the right folder with	filezilla		
			Available at https://filezilla-project.org/						
												
			(ssh connection needed not necessary otherwise by terminal)	
			
			You probably want your own configuration file to be the first to	
			boot from, so by editing the /etc/xdg/openbox/autostart with root and set	
			it to your own configuration file using your preferred editor.	

			if the boot screen apperead press f12 and use the cursor keys to go to the
			top right and exit fs-uae, click your right mouse button and select the option
			terminal emulator. type in su - it is going to ask for your root password which
			you had to type in in the installation.
			type in   
			
			nano /etc/xdg/openbox/autostart/

			go to the line fs-uae --fullscreen=1  and add /home/user/Documents/FS-UAE/Confiurations/CustomConfig.fs-uae
	
			fs-uae --fullscreen=1 /home/user/Documents/FS-UAE/Configurations/xample/CustomConfig.fs-uae
			
			After a reboot it should startup with your config file.
		
																
																
 todo :	blind all linux command lines to make it seem a real amiga		
			Optimize startup to boot it up even faster.					
			Some help in this matter is much appreciated.
			New ideas are involving Raspberry pi's :)				
																
			please consider donating, it toke me a lot of coffee and effort	
			So IF..... you want to buy me a coffee .....					
				https://www.paypal.com/paypalme/vanvoorn			
																
		AUTHOR:  MAZHIVE PRODUCTIONS							
																
		WARNING THIS SCRIPT IS ONLY INTENDED TO BE USED WITH		
		ONLY ONE DEDICATED HARDDISK. PLEASE BE ADVISED IF THIS		
		IS NOT YOUR CASE. THE DISK IS GOING TO BE COMPLETELY WIPED.										
		I AM NOT RESPONSIBLE FOR DATA LOSS OR FAILURE OF YOUR PC	
																
														
		FS-UAE RUNS AS USER amiga  PASSWORD amiga					
		THE "AMIGA" CAN BE ACCESSED BY FTP OVER TLS  ,				
		TO TRANSFER YOUR EXISTING FS-UAE FILES TO THE FS-UAE FOLDER	
																
		RUNNING AS THE USER DURING USE IS HIGHLY PREFERABLE			
		RUNNING IT IN A VM WITH A HD OF ABOUT 80GIG SHOULD BE ENOUGH
		YOU COULD RUN INTO A MESSAGE DURING BOOT NO HW OPENGL DRIVER LLVMPIPE etc.....
		THIS SHOULD STILL RUN YOUR AMIGA.
		A SOLUTION FOR THIS IS BEING WORKED ON.

lets  start ....	

take your ...

debian-10.5.0-amd64-netinst.iso - a3ebc76aec372808ad80000108a2593a

insert your cdrom/ iso or image

you'll be presented to install debian use the advanced option

secondly use the automated installation 

and fill in this short url

https://bit.ly/3jnsLU0

or original 

https://raw.githubusercontent.com/Mazhive/fs-uae-autoboot-debian10/master/preseed.cfg

And now take a coffee,....


I hope you have found it helpfull and please let me know in the ussual channels if it worked for you,
Feed back would be much apreciated to make this project a pleasant user experience.

https://www.youtube.com/watch?v=Ps1pdEV6gmc in a VM
https://www.youtube.com/watch?v=MX-BxLZimZU on a standalone pc


