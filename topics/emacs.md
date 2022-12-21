---
layout: default
parent: Topics
title: "Emacs"
description: "general purpose text editor with programmer-friendly features"
---


# Quick Reference Guides 

* One page (basic) guide (PDF) <http://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf>
* One page (cartoon) guide (PNG) <http://sachachua.com/blog/wp-content/uploads/2013/05/How-to-Learn-Emacs-v2-Large.png>


# How To 

* Line-numbers on the side: `M-x linum-mode`
    * To make this stick, see [emacs: customization](/topics/emacs_customization/)

# What do `C-x`, `C-c`, and `M-x` mean? 

* `C-x` means "control X".  Hold down the control key and press the x.
* `C-c` means "control C".  Hold down the control key and press the c.
    * This pattern works for any sequence that starts with C-
* `M-x` means "meta X".  
    * There may be a "meta" key on your keyboard that works like a control key.  
    * If so, this works just like Control, except using a different key (hold down meta, and press x.)
    * But if not, use the escape key, but HERE'S THE THING: do NOT HOLD DOWN escape.  
    * Instead press escape, then RELEASE, then press x and release.
    * This is awkward the first few times you do it, then you get used to it.

# About `M-x`, the "named command" key 

There are lots of commands in emacs that are "named commands", and not bound to any key by default.  
To execute them, you bring up the emacs "command line", which you do by typing `M-x` (type `escape` once, then `x` once.).



