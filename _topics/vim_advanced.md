---
topic: "vim: advanced guide"
desc: "some stuff outside of basic vim that's not essential but useful"
indent: true
---

Here are some Vim commands that are not essential but useful in increasing your productivity (and possibly maintaining your sanity).

# Modification commands

## a. The 'yy' command
This command copies the entire line the cursor is at. You can than use `p` to copy this line you copied.

## b. The `w`, `b`, `e`, and `ge` commands
To go to start of the next word (not the next occurance of the word, but jump to the next word in the line), use `w`. You can use the `b` command to go backwards.

You can use `e` and `ge` to go the end of the word, respectively.

## c. The `v` command
This starts `visual` mode, which allows highlighting (and eventually copy-pasting). `Shift+v` enters `visual line` mode, which you highlight multiple lines, while `ctrl+v` enters `visual block` mode, which you highlight multiple columns.

## d. The `r`, `a`, and `x` commands
While you're in the command mode, you can replace any letter you have highlighted over the cursor by pressing `r` and the letter you want to be replaced with.

The `a` command is like the `i` command, the only subtle difference is where the cursor is when you activate the command (`a` places the cursor one character after the cursor)

The `x` command is the exact opposite of `r`, `x` removes the character at the cursor.

## e. The `dd` command
The `dd` command can be used to delete the entire line the cursor is at, it's similar to `yy`, but for deletion.

If you add a number, say `5dd` in front of the `dd` command, it deletes the number of lines you specified starting from the line at the cursor.

Alternatively, `dd` behaves similar to `cut`, so you can use `dd` and `p` to cut and paste lines.

# Navigation commands 

## a. The `%` command
Sometimes you may want to transition between brackets. You can do the `%` command, to put your cursor rapidly between the left and right bracket. This will work for `{}`, `[]`, and `()`.

## b. The `^`, `$` , `0`, and `gm` commands
You can use the `^` command to place the cursor at the start of the text of a line, and the `$` to go to the end of the text in a line.

`0` and `gm` work similarly, but they place the cursor at the physical start of the line instead of the start of the text, respectively.

## c. The `G` and `gg` commands
`G` goes to the bottom of the file, while `gg` goes back to the top (this is while in command mode).

# The `u` commands
These commands can revert edits.

To undo the last change, use `u`.
To repeat the last change, use `.`

