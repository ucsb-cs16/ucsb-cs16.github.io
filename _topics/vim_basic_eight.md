---
topic: "vim: basic eight"
desc: "eight things you need to know how to do for your survival"
indent: true
---

Here are eight things you should know how to do in `vim` to be able to "survive" with `vim` as your text editor if you 
absolutely have to.

Once you've mastered these basic eight functions, you should either:
* (a) fully learn `vim`, or
* (b) fully learn some modern editor such as [atom](/topics/atom) or [Visual Studio Code]{/topics/code)

1. quit without saving
2. enter code
3. save
4. copy/paste 
5. search/replace 
6. show line numbers
7. goto a line number
8. save as

Each of these is explained below.    But first, step "0" is to learn three basic vim concepts: escape, modes, and the `vim` command line.

# 0. Escape, modes, and the `vim` command line

You gotta learn these three things first.

## a. The "esc" key ("escape")

The "escape" key, sometimes labelled "esc" is at the upper left hand corner of your keyboard.  You are gonna need that a lot.
Find it now.  Ok, good.

## b. "insert mode" vs. "edit mode"

`vim` is always in one of two modes:

* "insert mode", where the letters, numbers and punctuation symbols you type are being "inserted" into the document.
   * In insert mode, the letters `-- INSERT --` appear at the bottom left hand corner of the screen.
   
* "edit mode", where each key on the keyboard, including the letters, numbers and punctuation marks, may have some special meaning, like cut, paste, save as, etc.

If you don't know which mode you are in, you are "gonna have a bad time".    

Here's the basic way of moving between the modes:

* The "escape" key moves you from insert mode to edit mode
* The `i` key moves you from edit mode to insert mode

There are a few others ways to move between the modes, but that's enough for "survival vim".

## c. The command line (`:`)

There are some things you do in `vim` at the command line.  

The command line is at the bottom of the screen, and starts with the character `:` (colon).

You get to the command line by typing the `:` character when you are in edit mode.

When you do, the cursor jumps to the bottom of the screen.  You get the cursor back in the document by
either:
* (a) typing in a command and hitting enter
* (b) just hitting enter without typing in a command (which does nothing.)

# The basic eight

## 1. quit without saving: `:q!`

To quit *without saving* in vim:
* Type the "escape" key to make sure you are in "edit mode"
* Type `:` to put yourself in commmand line mode (cursor jumps to bottom of screen)
* Type `q!` and hit enter.   The `q` means "quit" and the `!` means "don't ask me about unsaved changes, just do it."

# 2. enter code

To enter code:

* Look at bottom of the screen.  Are you in insert mode?  
* If not, type `i` to go into insert mode
* Type in code.
* Use the arrow keys to move around the screen, and the backspace/delete key to erase things you don't want.

# 3. save and quit

To save changes and quit:

To quit *without saving* in vim:
* Type the "escape" key to make sure you are in "edit mode"
* Type `:` to put yourself in commmand line mode (cursor jumps to bottom of screen)
* Type `wq` and hit enter.   The `w` means "write" (as in "write to disk", i.e. "save")  and `q` means "quit".

# 4. copy/paste 

TBD

# 5. search/replace 

TBD

# 6. show line numbers

TBD

# 7. goto a line number

TBD

# 8. save as

TBD

