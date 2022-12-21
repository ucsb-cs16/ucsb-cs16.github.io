---
layout: default
parent: Topics
title: "Git/github: CSIL configuration"
description: "Configuring your CSIL account to use git"
indent: true
prefix: "git/github: "
---

This page has three sections:

* *How* to configure your CSIL account for git
* *Why* you need to configure your CSIL account for git
* *What about GUI* options for git?

How
---

This section describes how to configure your CSIL account for git.

To set up your CSIL account for using command line git, type the following commands, substituting your real name (e.g. `Chris Gaucho`) in place of `"Your Name"` and your email address (e.g. `cgaucho@ucsb.edu`) in place of `"you@example.com"`.

```
git config --global user.name "Your Name"
git config --global user.email you@example.com
git config --global push.default simple
```

You should only have to ever do these steps once for any given computer system. The values of these global configuration options are stored in a file called `.gitconfig` in your home directory. Take a look by cd'ing into your home directory, and using the `more` command to list the contents of `.gitconfig`:

```
$ cd
$ more .gitconfig
[push]
    default = simple
[user]
    name = Chris Gaucho
    email = cgaucho@ucsb.edu
$
```

The `~/.gitconfig` file is a plain text file, and the options in it can also be set by just editing this file. Using the git config command is an alternative to hand editing this file, and is really just a way to be sure that the syntax ends up being right.

Why
---

Why do you need to configure your CSIL account for git?

In this course, you'll have the option of completing many parts of many assignments on your own laptop or home computer. That will require that you have an appropriate C++ compiler and the "git" program on your own computer. If you want to do that, you are welcome to give it a try.

However, this is an OPTION, not a requirement. And, we do NOT make any commitment to providing tech support for C++, Git, or other software issues on your own laptop or desktop systems.

On the other hand:
* Future courses may require you to do certain assignments on CSIL/ECI, and CS16 is supposed to prepare you for that.
* Accoirdingly, it is REQUIRED that you be able to perform all course functions using your CSIL account, so that we can use our weekly discussion sections in the new Phelps CS Lab to their full advantage.

What about a GUI for git
------------------------

Even if you normally use a GUI interface for git, or a git plug in for an IDE such as Eclipse or Netbeans, it is important to learn the git commad line interface.

The official trainers from github.com themselves, emphasize strongly:

* git is fundamentally a command line tool
* We recommend that you learn the git command line so that if/when the GUI does something weird, you can get under the hood and fix things.
* Again to emphasize: "To learn git, you need to learn the command line interface."
