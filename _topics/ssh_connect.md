---
topic: "ssh-remote"
desc: "Connecting to CSIL remotely from your Mac, Linux or Windows machine"
---

## Connecting to CSIL

## Connecting to CSIL _Remotely_

### Step 2b: Connecting to CSIL via SSH on Mac OS X or Linux <a name="step2b"></a>

To get started on Mac OS X or Linux, you first need to open a terminal program. This involves slightly different steps on either OS.

#### On Ubuntu (an example of a Linux OS):

1. Find the search menu. It appears at the top of the Unity bar:

<img src="ssh-screenshots/ubuntu-menu.png" width="297" alt="Ubuntu Search Menu" />

2. Click on that icon to open the search menu. Then type "terminal" and click on the "Terminal" application which appears:

![ubuntu-search](ssh-screenshots/ubuntu-search.png)

#### On Mac OS X:

1. Open the "Terminal" application. It is found inside the <em>Applications</em> folder of your main drive, inside the <em>Utilities</em> subfolder. The icon looks like this:

<img src="ssh-screenshots/mac-terminal.png" width="79" alt="Mac OS X Terminal Icon" />

You can also find it using Spotlight by typing "terminal" and pressing ENTER.

Once you have a terminal window open on your machine, you next need to **connect to the CSIL server remotely**.

You will do this using a UNIX command (an internet protocol, really) called <em>SSH</em> (short for Secure SHell).

Type the following command in your terminal, replacing <b>USERNAME</b> with <b>your CoE username</b> and substituting ## with a number between 01 and 48 (**make sure to have a 0 in front**, if you are using numbers between 1 and 9). 
**Note**:
The <b>$</b> represents the terminal prompt; <i>you won't type this character</i>. Whenever you see it, that means that the following command is intended to be typed into the terminal window and run by pressing Enter.

```
$ ssh USERNAME@csil-##.cs.ucsb.edu
```

SSH will first ask you a question which looks like this:

```
The authenticity of host 'csil-[01-48].cs.ucsb.edu (128.111.43.14)' can't be established.
RSA key fingerprint is 90:ab:6a:31:0b:81:62:25:9b:11:50:05:18:d3:1a:b5.
Are you sure you want to continue connecting (yes/no)?

```

Type <b>yes</b> and then ENTER to continue. It will next ask for your **CoE account password**. When you type it in, **nothing will show on the screen** (not even dots). However, what you type is still being sent and once you are finished with your password, you can press ENTER to login.

<b>You should now be remotely connected to CSIL!</b> You can make sure by typing the following command (which will tell you what machine you are currently issuing commands to):

```
$ hostname

```

This should show <b>csil-[01-48].cs.ucsb.edu</b>. You can now do anything you could normally do in a terminal window in CSIL or the Phelps lab (except run graphical programs).


### Step 2c: Connecting to CSIL via SSH on Windows with PuTTY <a name="step2c"></a>

To connect remotely on Windows machines, we recommend using a program called <em>PuTTY</em>. This program is a well-known and widely-used SSH client for the Windows OS.

First, download the program from <a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html" target="_blank">http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html</a>. You only need the executable file <b>putty.exe</b>, but feel free to download any other programs that you want. The page includes portable versions and a version with an installer. <i>Always make sure to download PuTTY from this site</i>, so that you can make sure it is the correct program.

Once downloaded, run PuTTY like you would open other programs. If you just download the <b>putty.exe</b> file, you can open it from your downloads folder directly. You can also move it to any other location on your machine and open it from there. If you used the installer, open PuTTY from the Start Menu.

When PuTTY opens, you should see a window that looks like this:

<img src="putty-empty.png" width="469" alt="Empty PuTTY window" />

Type <b>csil-[01-48].cs.ucsb.edu</b> into the box labeled "Host Name (or IP address)". Leave the "Port" setting at 22 and leave the "SSH" button checked. The window should now look like this:

<img src="ssh-screenshots/putty-full.png" width="472" alt="Completed PuTTY window" />

Then click on the "Open" button to connect. PuTTY will then show a prompt which looks like this:

<img  src="ssh-screenshots/putty-hostkey.png" width="433" alt="PuTTY Host Key Prompt" />

Click "Yes" to accept and have PuTTY remember CSIL's key.

Once a connection is made, CSIL will ask for both your username and then your password. Type in your CSIL username and password. The password will not be shown on the screen, but the characters you type are being used. This step will look something like this (with your username instead of "username"):

<img src="ssh-screenshots/putty-login.png" width="677" alt="PuTTY Login Prompt" />

Once you have logged in successfully, you should be connected remotely to the CSIL server. Run the following command to make sure (this command shows the full host name of the machine you are logged in to):

```
$ hostname
```

This command should output <b>csil-[01-48].cs.ucsb.edu</b>. You can now do anything in this terminal window that you could do on a CSIL machine or a Phelps lab machine, except run graphical applications.

If you want to run graphical applications, instead of using puTTY, you can use other programs, such as [MobaXterm](http://mobaxterm.mobatek.net/){: target="_blank"}.


You can also install SSH clients on your tablet to connect remotely, just like you would from a computer.
