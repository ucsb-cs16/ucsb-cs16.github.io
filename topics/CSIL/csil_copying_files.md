---
parent: CSIL
grand_parent: Topics
layout: default
title: "Csil: Copying files"
description: "Copying files between your local computer and CSIL"
---

# Using `scp` to transfer files

The `scp` Unix command allows users to transfer files and folders between a local machine to/from a remote machine.
The terminal application on MacOS and CSIL machines are capable of using the `scp` command. It is possible to use
`scp` with Windows by installing additional programs.

For example, [Git for Windows](https://git-scm.com/download/win) allows you to use the MinGW64 (Minimalist GNU
for Windows) shell, which interfaces with your Windows file system, and supports common Unix commands including
`scp`.

# Example of transferring a file from a local machine to CSIL

Using the terminal application on your local machine, navigate to the folder containing the file(s) you want
to transfer to CSIL. For example, if I want to transfer a file called `text1.txt`, then use the following command:

```
$ scp text1.txt cgaucho@csil-17.cs.ucsb.edu:temp/
```

*Note:* You will be prompted to type in a password for your account. This username / password combination is asking
for your engineering account credentials, not your UCSBNet credentials.

In general, the command is broken down into:

```
scp [source_file] [username]@[remote_host]:[destination_folder]
```

`text1.txt` is the file I want to transfer to a remote destination. `cgaucho` is the username, `csil-17.cs.ucsb.edu`
is the remote host I want to transfer my file to, and `temp/` is the destination folder. Note that your working
directory when using `scp` is your home directory. `temp` is a folder that exists in your home directory.

# Example of transferring a file from CSIL to your local machine

This is very similar to the previous example, but our source / destination arguments are switched. If I wanted to
transfer the `text2.txt` file in my `~/temp/` directory on CSIL (note that `~` is a shortcut representing the path to
your home directory), then use the following command:

```
$ scp cgaucho@csil-17.cs.ucsb.edu:temp/text2.txt .
```

In this case, I am copying the `text2.txt` file from the remote host into the current directory (represented with '`.`').

# Example of transferring a directory between your local machine and CSIL

The same concepts apply, but in this case we want to recursively copy all files and subfolders to the destination.
You need to add the `-r` flag to the `scp` command to do this. To copy the `folder1` directory to CSIL,
then use the following command:

```
$ scp -r folder1 cgaucho@csil-17.cs.ucsb.edu:temp/
```

and to copy the `folder2` directory from a CSIL machine to your current directory, use the following command:

```
$ scp -r cgaucho@csil-17.cs.ucsb.edu:temp/folder2 .
```

*Note:* If you want to copy a file that already exists in your destination folder, then `scp` will replace it!

# For Windows Users

For Windows users, most of the scp commands will be similar, however, your paths would originate from your default drive (usually the `C` drive), so you need to change your path to where you want to download. If you installed Windows's SSH client, you could do `scp` and `ssh` commands in the Command Prompt (CMD)

To copy from CSIL to your (computer's `Downloads` folder)

```
C:\Users\cgaucho> scp cgaucho@csil-17.cs.ucsb.edu:temp/text2.txt C:\Users\cgaucho\Downloads\
```

To copy from your (computer's `Downloads` folder) to CSIL

```
C:\Users\cgaucho> scp C:Users\cgaucho\Downloads\text2.txt cgaucho@csil-17.cs.ucsb.edu:temp/
```

If you want to copy a folder, you would use the `-r` flag, like the examples above for UNIX systems. Just remember to replace your paths with the corresponding path in Windows.

# References
* [Git for Windows](https://git-scm.com/download/win)
* [scp quick guide](https://haydenjames.io/linux-securely-copy-files-using-scp/)

