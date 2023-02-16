---
parent: CSIL
grand_parent: Topics
layout: default
title: "CSIL: disk quota and file quota issues"
description:  "How to diagnose and fix"
indent: true
---

# CSIL disk quota Troubleshooting

If you are having trouble with your account you may be over quota.

Here is how you can tell:

```
[michaelhinrichs@butthead ~]$ quota -v
Disk quotas for user michaelhinrichs (uid 24268): 
     Filesystem  blocks   quota   limit   grace   files   quota   limit   grace
frigga:/local/home/student
                '''344192*''' '''300000'''  350000    none    5492    8000    8500        
[michaelhinrichs@butthead ~]$ 
```

There are two parts to being limited on CSIL. You are limited by your blocks (disk space) and by your number of files. First shown here is how to check and clean up disk space.

# Block limit problems (too many bytes)

To see what is causing the problem with we can do two commands:

The first one shows us how much disk space our '''regular''' files are taking up 

```
[michaelhinrichs@butthead ~]$ du -sh *
6.6M	cs24
4.0K	Desktop
8.0K	Documents
3.3M	Download
400K	Firefox_wallpaper.png
4.0K	Music
3.2M	NetBeansProjects
4.0K	Pictures
4.0K	Public
36K	public_html
4.0K	Templates
4.0K	Videos
[michaelhinrichs@butthead ~]$ 
```

We can see that, of the regular files, `CS24` is taking up the most room, but we DONT need to delete that! In a minute we will show how to investigate that further...

You can also check to see the top ten folders taking up disk space by running du -sk and piping that output to a sort, then piping that sorted list to head, which lists the first ten lines.

```
[goodman@booboo ~]$ du -sk * .??* | sort -rn | head
95040	.mozilla
82084	.netbeans
29592	.local
11052	ccache.tar.gz
8148	.ccache
7768	.pulse
3696	.wapi
2044	.cache
1524	.adobe
1276	cs1l.tar.gz
[goodman@booboo ~]$ 
```


The second one shows us how much disk space our '''hidden''' files are taking up, as you can see from `.thunderbird` and `.mozilla`, this is where the REAL space is being taken up.   Look at the numbers for `.thunderbird` and  `.mozilla`:

```
[michaelhinrichs@butthead ~]$ du -sh .[A-z]*
0	.bash_history
4.0K	.bash_logout
4.0K	.bash_profile
4.0K	.bashrc
164K	.cache
8.6M	.ccache
72K	.config
4.0K	.cshrc
4.0K	.cvspass
212K	.dbus
96K	.emacs.d
4.0K	.esd_auth
476K	.evolution
116K	.fontconfig
4.0K	.forward
588K	.gconf
4.0K	.gconfd
104K	.gnome2
4.0K	.gnome2_private
372K	.gstreamer-0.10
4.0K	.gtk-bookmarks
4.0K	.gvfs
28K	.ICEauthority
120K	.icedteaplugin
4.0K	.icons
0	.imsettings.log
320K	.kde
4.0K	.lesshst
9.9M	.local
4.0K	.login
560K	.macromedia
15M	.mozilla
608K	.nautilus
58M	.netbeans
16K	.netbeans-registration
12K	.netx
4.4M	.openoffice.org
12K	.outfile.swp
4.0K	.profile
6.3M	.pulse
4.0K	.pulse-cookie
4.0K	.recently-used.xbel
4.0K	.saves-27343-freakazoid.cs.ucsb.edu
4.0K	.saves-9316-bart.cs.ucsb.edu
8.0K	.ssh
56K	.subversion
4.0K	.themes
24K	.thumbnails
199M	.thunderbird
124K	.tomboy
8.0K	.tomboy.log
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-11.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-12.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-19.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-23.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-24.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-25.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-26.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-29.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-2.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-4.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-5.tmp
0	.uc-429d3c16fe89cafdc89c5ddef25a08b0.michaelhinrichs.esbtl-8.tmp
8.0K	.viminfo
19M	.wapi
4.0K	.Xauthority
du: cannot access `.xsession-errors': Input/output error
0	.xsession-errors.old
[michaelhinrichs@butthead ~]$ 
```

If you don't care about your bookmarks in your web browser (`.mozilla`) and you have your email somewhere else besides `thunderbird`, you can delete both of those directories.

Here's how.

```
[michaelhinrichs@butthead ~]$ echo rm -rf .thunderbird
rm -rf .thunderbird
[michaelhinrichs@butthead ~]$ rm -rf .thunderbird
[michaelhinrichs@butthead ~]$ quota -v
Disk quotas for user michaelhinrichs (uid 24268): 
     Filesystem  blocks   quota   limit   grace   files   quota   limit   grace
frigga:/local/home/student
                 '''140460  300000'''  350000            5357    8000    8500  
```

Two very important things about this step:

1) The `echo` command just prints the text that follows after the code and acts as a safety because if if you accidentally execute `rm -rf` on the wrong thing, you will have effectively deleted all of your files in the CSIL domain. 

2) Make sure that you are in your home directory or you wont delete any of your `.thunderbird` files.

# Number Of Files Problems (too many files)


Now if you are being limited by number of files, you can run the command `countfiles` from Phill Conrad's `bin` directory as follows:

```
[goodman@booboo ~]$ /cs/faculty/pconrad/bin/countfiles

Searching: current directory (this might take a few minutes)...

Files	Directory
_____	_________
1811	.netbeans
1009	.mozilla
615	.ccache
323	.pulse
309	.gconf
138	.macromedia
138	.local
131	cs130a
101	.dbus
88	.config
-------------------------------------
5160	in entire directory

Use count_files.pl --man for more information
```

This useful script comes from this [git repo](https://github.com/rkip/countfiles) and used to be maintained on CSIL, but was removed for reasons that still are not entirely clear (since there is no other common Unix utility that fills this niche.)

If you've taken a number of CS classes and are not bumping up against the blocks quota, you can simply choose to tarball your older CS folders in order to reduce the file count of each folder to 1.   You can always untar them again later if you need them (`tar -zxvf cs24.tar.gz` is used to undo restore from the tarball. )

```
[goodman@booboo ~]$ tar -cvzf cs24.tar.gz cs24
```

