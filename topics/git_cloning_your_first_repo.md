---
layout: default
parent: Topics
title: "Git: cloning your first repo"
description: "A guide for those new to git"
indent: true
---

The instructions below are written from the standpoint of someone that has never used git before on CSIL. 
If you have never used git before, then just follow the instructions as given.

<b>If you already used git in a previous course</b>, then you might be
aware that using the ssh protocol rather than https to clone repos has
certain advantages. You may also have ssh keys set up on
github.com and/or github.ucsb.edu for your CSIL account. If so, and you remember how to
do it, <em>you may use the ssh URLs for cloning your repo</em>. It's
entirely up to you. That will simply things because you won't have to
enter your username/password as often.

If you've forgotten how, don't worry—just follow the instructions as
given. We'll cover ssh keys in the next lab. Above all, don't show off
and confuse any git noobs by trying to bring up ssh keys before
they've gotten used to the basics.

### Locate your first repo

Go back to web browser where you have github open.

Navigate to the web page for your repository, and find the green "Clone or Download" link.

Click on it, and a dialog opens up where you can choose either to "Use HTTPS" or "Use SSH".   

If you have already [configured github SSH access for your CSIL account or the computer you are using](github_configure_ssh) then
you can use SSH.  Otherwise, choose HTTPS.
* Either way will work.  The difference is one of convenience; when using ssh you don't have to type your username/password as often.

You'll come back to this link in a moment.

# Cloning the repo on CSIL

Open a shell on your CSIL account, and create a directory for your course, e.g. cs16:

    -bash-4.2$ mkdir -p ~/cs16
    -bash-4.2$ cd ~/cs16
    -bash-4.2$ pwd
    /cs/student/bobgaucho/cs16
    -bash-4.2$

Now you will "clone" your repository. This creates a copy of your
repository—which is a separate repository in its own right—in your
cs16 directory on the CSIL systems.

Copy the clone URL from the github window.

- Note that this is NOT THE SAME as the URL shown in the browser url window. Don't copy that one!
- The URL should end with the letters `.git`

Next, in the terminal window where you are in your ~/cs16 directory,
type the command below to clone the repository into a new directory 
that has the same name as your repo (e.g. lab00_jgaucho).
Be sure to replace the URL shown below with the one you copied 
from the web page.

    $ git clone https://github.com/UCSB-CS16-M16/lab00-jgaucho.git
    ...

and you should see something like this. If you used an https link, you will be asked for a
username and password. Note that this is your github username and password.  If you used
an ssh url, you won't need to put in a username/password (unless you protected your ssh key 
with a passphrase).

    -bash-4.2$ git clone https://github.com/UCSB-CS16-M16/lab00-jgaucho.git
    Cloning into 'lab00-jgaucho'...
    Username for 'https://github.com': jgaucho
    Password for 'https://bgaucho@github.com':
    remote: Counting objects: 8, done.
    remote: Compressing objects: 100% (5/5), done.
    remote: Total 8 (delta 0), reused 4 (delta 0)
    Unpacking objects: 100% (8/8), done.
    -bash-4.2$

This should create a new directory called lab00_jgaucho

cd into that directory and use the ls command to list the files.

    $ ls
    lab00_jgaucho
    $ cd lab00_jgaucho
    $ ls
    README.md
    $

Now you can work in that direcctory.  When you are ready to commit changes, you'll use the typical git workflow:

* `git add filename`
* `git commit -m "description of what you did`
* `git push origin master`

With `git status` commands in between each step to keep track of what you are doing.  But that's a subject for another lesson.
