---
topic: "CSIL: Mount CSIL drive Via MacOS"
desc: "Remotely Mount your CSIL drive to your MacOS system via cifs/smb using SAMBA"
indent: true
---

# Accessing CSIL Drive from MacOS using SAMBA

To mount CSIL drive onto your MacOS machine, you must on the UCSB network. If you are on your own local network you can use the `UCSB Pulse Secure VPN`. 

Video instructions: <https://youtu.be/FTlxjhjwbt0>


## UCSB Pulse Secure VPN
*Note: You can skip this step if you are on the `eduraom` or `ucsb wireless web` network*

To download, install, and run the USCB Pulse Secure VPN  follow download link below and the guide created by the [UCSB IT](https://www.it.ucsb.edu/) department.  

Here is the link to [Download](https://ucsb.app.box.com/v/vpn-mac). 

Here is the link to the [Guide](https://www.it.ucsb.edu/pulse-secure-vpn-client-mac-os). 

Once we have our VPN running we can mount our csil drive to our local machine.


## Mount Drive Using Samba

To mount your csil drive simply open this link **[smb://samba.engr.ucsb.edu](smb://samba.engr.ucsb.edu)** in your finder. 
Or follow the ucsb [Engineering documentation](https://doc.engr.ucsb.edu/pages/viewpage.action?pageId=3342386) to do it manually. 

You will be prompted to login with your engineering/csil account. 
After loggin in with your credentials, you will be prompted to select the volume you want to mount. Scroll to the bottom and select your csil drive.

Once you are connected, you should have your csil drive mounted as a virtual disk right below Remote Disk in your finder. 

You can now access your shared files with read and write privilages!

**This can be `extremely` useful if you want to edit files on CSIL using your favorite `IDE`.**

