---
layout: default
parent: Topics
title: "Vim: basic eight"
description: "eight things you need to know how to do for your survival"
indent: true
---

Here are eight things you should know how to do in `vim` to be able to "survive" with `vim` as your text editor if you 
absolutely have to.

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

Bonus tip: "CTRL-&#91;" can be used instead of the escape key if that's more comfortable for your fingers.

## b. "insert mode" vs. "command mode"

`vim` is always in one of two modes:

* "insert mode", where the letters, numbers and punctuation symbols you type are being "inserted" into the document.
   * In insert mode, the letters `-- INSERT --` appear at the bottom left hand corner of the screen.
   
* "command mode", where each key on the keyboard, including the letters, numbers and punctuation marks, may have some special meaning, like cut, paste, save as, etc.

If you don't know which mode you are in, you are "gonna have a bad time".    

Here's the basic way of moving between the modes:

* The "escape" key moves you from insert mode to command mode
* The `i` key moves you from command mode to insert mode

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
* Type `:` to put yourself at commmand line (cursor jumps to bottom of screen)
* Type `q!` and hit enter.   The `q` means "quit" and the `!` means "don't ask me about unsaved changes, just do it."

# 2. enter code

To enter code:

* Look at bottom of the screen.  Are you in insert mode?  
* If not, type `i` to go into insert mode
* Type in code.
* Use the arrow keys to move around the screen, and the backspace/delete key to erase things you don't want.

Bonus tip:
* The "old school" way of moving around in vim command mode is to use the letters `h`, `j`, `k`, and `l`.
* `h`, `j`, `k`, and `l` are the equivalent of ←, ↓, ↑, →, respectively.

# 3. save and quit

To save changes and quit:

To quit *with saving* changes in vim:
* Type the "escape" key to make sure you are in "edit mode"
* Type `:` to put yourself at the commmand line (cursor jumps to bottom of screen)
* Type `wq` and hit enter.   The `w` means "write" (as in "write to disk", i.e. "save")  and `q` means "quit".

# 4. copy/paste or cut/paste

From [this Stack Overflow answer](https://stackoverflow.com/questions/13447066/vi-editor-copy-a-block-not-usual-action)

* Make sure you are in edit mode (use "escape" if you aren't)
* Position the cursor where you want to begin cutting.
* Press `v` to select characters (or uppercase `V` to select whole lines).
* Move the cursor to the end of what you want to cut.
* Press `y` to copy ("yank") (or `d` to cut ("delete")) .
* Move to where you would like to paste.
* Press `P` to paste before the cursor, or `p` to paste after.

# 5. search/replace 

To repeatedly search for a string:

* Make sure you are in command mode (use "escape" to get there if you are not)
* Press `/` and the cursor jumps to bottom of screen
* Type what you want to search for and hit enter.
* You will jump to the next occurance
* To search for the same thing again, just press `/` and enter again (repeat as often as needed)

To search/replace foo to bar in the entire file *all at once*

* Make sure you are in command mode (use "escape" to get there if you are not)
* Use `:` to get to the command line
* Type `%s/foo/bar/g`  
   * `%` means "on every line in the whole document"
   * `s` means "substitute"
   * `/foo/bar/` means change `foo` to `bar`
   * `g` means "globally", i.e. every occurence on that line

To search/replace foo to bar one occurance at a time:

(from [this Stack Overflow article](https://stackoverflow.com/questions/505848/interactive-search-replace-regex-in-vim) )

* Make sure you are in command mode (use "escape" to get there if you are not)
* Use `:` to get to the command line
* Type `%s/foo/bar/gc`
   * Explanation is the same as above, except that we add `c` which means "confirm each change"
* Your cursor jumps to first occurance of `foo` and you'll see this: 
   ```
   replace with bar (y/n/a/q/l/^E/^Y)?`
   ```

   Here what each of those does:
   
   * `y` to substitute this match
   * `l` to substitute this match and then quit ("last")
   * `n` to skip this match
   * `<Esc>`   to quit substituting
   * `a`     to substitute this and all remaining matches
   * `q`     to quit substituting 
   * CTRL-E  to scroll the screen up 
   * CTRL-Y  to scroll the screen down 



# 6. show line numbers

(From [this article](https://kb.iu.edu/d/afcx))


* Press the Esc key if you are currently in insert or append mode.
* Press : (the colon). The cursor should reappear at the lower left corner of the screen next to a : prompt.
* Enter the following command:
   ```
   set number
   ```
* A column of sequential line numbers will then appear at the left side of the screen. Each line number references the text located directly to the right.

## 7. goto a line number

(From [this article](https://kb.iu.edu/d/adxw))

* Press the Esc key if you are currently in insert or append mode.
* Press : (the colon). The cursor should reappear at the lower left corner of the screen next to a : prompt.
* Enter the line number you want to go to and press return
* You'll jump to that line number

Bonus tips:

* Use `:1` to get to top of a file
* Use `:$` to get to the bottom of a file (`$` in place of a line number means "the last line in the file")

# 8. save as

* Press the Esc key if you are currently in insert or append mode.
* Press : (the colon). The cursor should reappear at the lower left corner of the screen next to a : prompt.
* Enter `w foo.cpp` to save the file under the name `foo.cpp`

Bonus tip:

* The name given can be a full path, e.g.  `:w ~/cs16/lab04/foo.cpp`

# Even more bonus tips

For now these are not part of the basic eight, though we might add them in future quarters.   They arguably should have made the list.

## Undo is the `u` key 

When you are in "Command Mode", the `u` keystroke will undo.  Type it multiple times to do multiple levels of undo.

### CTRL-Z does NOT undo

Note that if you are used to typing `CTRL-Z` **this does not work in vim**.  Instead, it will "put vim to sleep" and put you back at the Unix command line.  To bring it back to life, use `fg` at the command line.

Type `jobs` to see if you have "sleeping vim" instances.   If you did, it will list them.  You can use `fg` to bring them back to life and quit them one-by-one.




