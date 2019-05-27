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


## 1. The `w` and `v` command



# 2. The `r` command
While you're in the command mode, you can replace any letter you have highlighted over the cursor by pressing `r` and the letter you want to be replaced with.

# 3. The `%` command
Sometimes you may want to transition between brackets. You can do the `%` command, to put your cursor rapidly between the left and right bracket. This will work for `{}`, `[]`, and `()`.

# 4. Deleting lines/cut and paste
The `dd` command can be used to delete the entire line the cursor is at.

If you add a number, say `5dd` in front of the `dd` command, it deletes the number of lines you specified starting from the line at the cursor.

Alternatively, `dd` behaves similar to `cut`, so you can use `dd` and `p` to cut and paste lines.

# 5. search/replace 


# 6. show line numbers


# 7. goto a line number


# 8. save as

# Even more bonus tips

For now these are not part of the basic eight, though we might add them in future quarters.   They arguably should have made the list.

## Undo is the `u` key 

When you are in "Command Mode", the `u` keystroke will undo.  Type it multiple times to do multiple levels of undo.

### CTRL-Z does NOT undo

Note that if you are used to typing `CTRL-Z` **this does not work in vim**.  Instead, it will "put vim to sleep" and put you back at the Unix command line.  To bring it back to life, use `fg` at the command line.

Type `jobs` to see if you have "sleeping vim" instances.   If you did, it will list them.  You can use `fg` to bring them back to life and quit them one-by-one.




