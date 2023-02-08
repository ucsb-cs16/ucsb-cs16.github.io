---
parent: Topics
layout: default
title:  "Ssh"
description: "Connecting to CSIL remotely from your Mac, Linux or Windows machine"
has_children: true
---

# Connecting to CSIL

## On Mac OS X:

1. Open the "Terminal" application. It is found inside the <em>Applications</em> folder of your main drive, inside the <em>Utilities</em> subfolder. The icon looks like this:

<img src="ssh-screenshots/mac-terminal.png" width="79" alt="Mac OS X Terminal Icon" />

You can also find it using Spotlight by typing "terminal" and pressing ENTER.

Once you have a terminal window open on your machine, you next need to **connect to the CSIL server remotely**.

You will do this using a UNIX command (an internet protocol, really) called <em>SSH</em> (short for Secure SHell).

Type the following command in your terminal, replacing <b>USERNAME</b> with <b>your CoE username</b> 

The <b>$</b> represents the terminal prompt; <i>you won't type this character</i>. Whenever you see it, that means that the following command is intended to be typed into the terminal window and run by pressing Enter.

```
$ ssh USERNAME@csil.cs.ucsb.edu
```

SSH will first ask you a question which looks like this:

```
The authenticity of host 'csil.cs.ucsb.edu (128.111.43.14)' can't be established.
RSA key fingerprint is 90:ab:6a:31:0b:81:62:25:9b:11:50:05:18:d3:1a:b5.
Are you sure you want to continue connecting (yes/no)?

```

Type <b>yes</b> and then ENTER to continue. It will next ask for your **CoE account password**. When you type it in, **nothing will show on the screen** (not even dots). However, what you type is still being sent and once you are finished with your password, you can press ENTER to login.

<b>You should now be remotely connected to CSIL!</b> You can make sure by typing the following command (which will tell you what machine you are currently issuing commands to):

```
$ hostname

```

This should show <b>csil-[01-48].cs.ucsb.edu</b>. You can now do anything you could normally do in a terminal window in CSIL or the Phelps lab (except run graphical programs).



## Connecting to CSIL via SSH on Windows through the Command Prompt (CMD)

Windows has it's built-in SSH client, and you can connect through CSIL directly through SSH from the CMD.

To install the SSH Client:

1. Go to your `Windows Settings`
2. Then, go to `Apps`
3. Under `Apps`, go to `Manage optional features` under the page `Apps & features`
4. From there, click `Add a feature`
5. Scroll all the way down, find `OpenSSH Client`, install it
6. If `OpenSSH Client` isn't under `Add a feature`, go back, scroll all the way down and check if your Windows already has the `OpenSSH Client`
7. If Windows prompts a restart, restart your computer

Now that you have your Windows SSH client installed, open your `Command Prompt`

Follow the command for MacOS from above, you should be prompted with the same messages, prompts to enter your COE password. Once successful, you should now be connected to CSIL through SSH, under Windows' CMD

Note: You can now also use `scp` to copy files between your laptop and CSIL

## On Ubuntu (an example of a Linux OS):

1. Find the search menu. It appears at the top of the Unity bar:

<img src="ssh-screenshots/ubuntu-menu.png" width="297" alt="Ubuntu Search Menu" />

2. Click on that icon to open the search menu. Then type "terminal" and click on the "Terminal" application which appears:

![ubuntu-search](ssh-screenshots/ubuntu-search.png)

3. Follow the command for MacOS from above, you should be prompted with the same messages, prompts to enter your COE password. Once successful, you should now be connected to CSIL through SSH, under Windows' CMD
