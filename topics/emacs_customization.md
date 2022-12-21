---
layout: default
parent: Topics
title: "Emacs: customization"
description: "making changes that happen every time you run emacs"
indent: true
---

Stuff on this page is for when you are already really comfortable with the basics of emacs, and are ready to go beyond the basics.  
Don't dive into this stuff too soon.

Basic stuff is here: [emacs](/topics/emacs/)
 
# Editing your `~/.emacs` file 

Your `~/.emacs` file, stored in your home directory, is a place where you can customize the behavior of emacs.  
You put code in your `~/.emacs` file, written in a special dialect of the programming language LISP, 
to customize the behavior of Emacs.

(Warning: that's a bit of an oversimplified statement, since there are many different versions and flavors of emacs, 
and the exact location of what is known as the  `~/.emacs` file can vary a bit.  For example, it might be a directory called `.emacs.d` instead.  [This page](https://www.emacswiki.org/emacs/DotEmacsDotD) discusses some of the complications
that can occur.   You've been warned.)

# Line Numbers


* Adding a space: `(setq linum-format "%d ")`
    * Source: <http://www.emacswiki.org/LineNumbers>
* Making line numbers on the side always show up: `(global-linum-mode t)`
    * Source: <http://stackoverflow.com/questions/2034470/how-do-i-enable-line-numbers-on-the-left-everytime-i-open-emacs>


# Customizing your indentation

* <http://www.emacswiki.org/emacs/IndentingC>

