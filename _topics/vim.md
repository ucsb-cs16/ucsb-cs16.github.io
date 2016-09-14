---
topic: "vim"
desc: "a widely used text editor among Unix users"
---

# What is vim?

Historically, there are two widely used text editors among Unix users: `vi` and `emacs`.  

* `vim` is the most recent version of vi
* `vim` stands for <tt><b>vi</b> i<b>m</b>proved</tt>
* `vim` and `emacs` tend to have long arguments about which is better.  
    * These arguments are pointless and tedious.   
    * They are both good; they just have different design tradeoffs.
    
If you want to learn about emacs instead of vim, visit the [Emacs Page](/topics/emacs/) on this website.
Since this page is about vim, we won't mention emacs further.   

# Quick Reference Guides 

* Vim wiki http://vim.wikia.com/wiki/Category:Getting_started
* Vim tutorial http://vim.wikia.com/wiki/Tutorial

# How To

* Line-numbers on the side: `:set nu`  
    * To make this persist between invocations of vim, see [Vim: Customization](/topics/vim_customization/)

* What do  `:w`, `:wq`, and `:wq!` mean?

* `:w` means "write".  Hit "Escape" and type in the character sequence to write your edits.
* `:wq` means "write and quit".  Hit "Escape" and type in the character sequence to write and quit from the Vim environment.
* `:q!` means "quit without saving".  

And a bonus:

* `:u` means "undo".



# Finding and Replacing

* To go to a specific line number: `:[LINE_NUMBER]`
    * For instance, if I was trying to go to line 181 in a file, I would enter `:181`

* To search for a character string: `/[STRING]`
    * Note that you may need to use the escape character `\` before any special characters 

* To search/replace (e.g. change `old` to `new`):
    * To replace the first encountered instance of a string: `:%s/old/new/`
    * To replace all instances of a string: `:%s/old/new/g`
