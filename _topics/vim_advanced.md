---
topic: "vim: advanced guide"
desc: "some stuff outside of basic vim that's not essential but useful"
indent: true
---

Here are some Vim commands that are not essential but useful in increasing your productivity (and possibly maintaining your sanity).

# 0. Copy and paste

You gotta learn these three things first.

## a. The 'yy' command

## b. Visual-block mode


## c. Visual-line mode


## 1. The 'w' and 'v' command



# 2. The 'r' command

# 3. The '%' command


# 4. Deleting lines/cut and paste



# 5. search/replace 


# 6. show line numbers


## 7. goto a line number


# 8. save as

# Even more bonus tips

For now these are not part of the basic eight, though we might add them in future quarters.   They arguably should have made the list.

## Undo is the `u` key 

When you are in "Command Mode", the `u` keystroke will undo.  Type it multiple times to do multiple levels of undo.

### CTRL-Z does NOT undo

Note that if you are used to typing `CTRL-Z` **this does not work in vim**.  Instead, it will "put vim to sleep" and put you back at the Unix command line.  To bring it back to life, use `fg` at the command line.

Type `jobs` to see if you have "sleeping vim" instances.   If you did, it will list them.  You can use `fg` to bring them back to life and quit them one-by-one.




