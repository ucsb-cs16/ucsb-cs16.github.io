---
layout: default
parent: Topics
title: "Code"
description: "Visual Studio Code, a free-open source graphical editor available on CSIL, plus Mac, Windows, Linux"
---

Visual Studio Code is a free and open source graphical editor.  While it is free and open source, it should be noted that
it is nevertheless a Microsoft product.

# On CSIL

To edit hello.cpp with Visual Studio Code on CSIL, type:

```
code hello.cpp
```

What should happen is that the Unix command prompt returns immediately, but that after a few seconds, a window pops up with the
Visual Studio Code editor.

# What if no window pops up?

Try adding `--status` to the command, like this:

```
code hello.cpp --status
```

or simply:

```
code --status
```

If you get a message that includes `cannot open display`, such as the one below, it means that you are not logged in to a terminal 
that has graphical display capabilities.   This may happen, for example, if you are remotely logged in with an `ssh` type program.
In that case, see the options for using Visual Studio Code remotely, listed later on this web page.

```
[pconrad@pixie ~]$ code --status
[17773:0620/125204.948448:ERROR:browser_main_loop.cc(279)] Gtk: cannot open display:
[pconrad@pixie ~]$ 
```

# Remote Options

Visual Studio Code always works best when it is run directly on the machine at which you are physically sitting.  That is:

* If you are at a machine in Phelps 3525, or the CSIL lab, and you run `code` directly on that machine, all will be well.
* If you are sitting at your own Windows or Mac machine, or ssh'd in from your own Linux machine, your best bet is to install Visual Studio Code
   locally on your machine, and edit there.

# But how do I access my file and the compilers on CSIL in that case?

Good question.  There several options.

* The most straightforward, but possibly error prone option, is to just copy files back and forth.  There are various
   [file copy programs](/topics/csil_copying_files/)
* A second option is to use a github repo to move the files back and forth between your local system, and CSIL.  This will give you lots
   of practice with doing `git add`, `git commit`, `git push`, and `git pull`.  However, it has the following down side: it 
   means that you will need to do a commit with every edit.  That is typically not the best practice.  We typically want to
   do a commit with each unit of meaningful work, i.e. when you've added a a feature, fixed a bug, etc.   Doing it with every
   edit that you want to test will have you committing work a bit too often.   That might not be the worst thing; new users
   of git tend to err on the side of having too *few* commits.  But still, it isn't the best practice.
* The best way, if you can get it to work, is something called `sshfs`.   This is a way of literally mounting your CSIL home
  directory so that it *appears* to be local hard drive on your own computer.    That is super useful, but deserves
  a page of its own, which you can find here: [sshfs](/topics/sshfs/)
 
# Installing code on Windows, Mac, Linux

For download and installation instructions, visit:

* <https://code.visualstudio.com/download>

