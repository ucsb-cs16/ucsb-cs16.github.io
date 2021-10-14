# CSIL SSH Macro

This page will go over how to create an alias for the `ssh` command so that you can log into CSIL more easily from your local computer and without being prompted for a password. Please note that you are still responsible for knowing how to ssh into CSIL even if you decide to create an alias for it.


## Creating an alias for the SSH command
The following commands should be performed on your local machine, **not** on CSIL. You can tell if you are in CSIL by checking your terminal window. If the prompt looks like the one below (the number might be different), you are remotely connected to CSIL and you should log out before completing the following steps. 
```
[username@csilvm-08 ~]$
```

1. In the root directory, open and edit `.bash_profile`. This file may or may not already exist (to check use `ls -a`). 
	```
	cd && vim .bash_profile
	```
2. Create the alias by adding the following line in `.bash_profile` :
	```
	alias csil='ssh username@csil.cs.ucsb.edu'
	```
	>Note: Do not add spaces before or after the `=` or the alias may not work.
	
3. Update the terminal to use the new alias by either closing the terminal window and opening a new one, or using the following command:
	```
	source .bash_profile
	```
4. Now try using the command `csil` on your machine, and it should connect you to a CSIL machine. Using the `csil` command is now equivalent to calling `ssh username@csil.cs.ucsb.edu`. 

>Note: We use `csil` as our alias name, but you can change `csil` to another name in step 2 if you would like to use a different command to SSH in.

## Logging into CSIL without password prompt

In the following section we will refer to your own machine as your **local** machine and the CSIL machine as the **remote** machine. Please keep track of which steps are performed on the local vs. remote machine. 

1. On your local machine, in the root directory navigate to the `.ssh` folder and check that you have both `id_rsa` and `id_rsa.pub` files. 
		
	-  Change to `.ssh` directory from home directory
		```
		cd ~/.ssh
		```
	- Check if you have `id_rsa` and `id_rsa.pub` by using `ls`. 

	If you get an error saying `.ssh: No such file or directory` or you do not see `id_rsa.pub` in your `.ssh` directory, do the following command to generate a SSH public/private key. 
	```
	ssh-keygen
	```
	> Note: The prompt will ask you where you want to save the file. Just press enter; this will save it to its default location in `~/.ssh`. It will also prompt you to add a password.  **It is recommended that you do not add a password for the key used for this purpose** since you will be required to enter the password every time you SSH into CSIL using this key, defeating the purpose of completing this section. 
	
2.  On your local machine, print the contents of `id_rsa.pub` and copy it onto your clipboard. 
	``` 
	cat id_rsa.pub
	```
	This will print out something like the following:
	```
	ssh-rsa
	AAAAB3NzaC1yc2EAAAADAQABAAABAQDYySoh7b1uGpI7saLozpgXz184YYgC9k22zLH8TqKiSLAcNCO5hEzgC0kZoytCMtw/hUx3kto8
	apPS4ORL6HebWXuGfzQ3nQslPpBNmto0hdo446wBu/Hl5a7pC3SZUzti4YbUjRDOBgM5zQMaopTXhtqNY/tRB8/lSSYaEtIxLN5twk29
	IQUoA2wdPTmU/fRPc3PUdD9/KHJfBIL/ROsOb73tGOxqZoMnzV0ElmLhjq6WEqNWypaFrI0YU8OmIvxmlDXn0gkr3oYHqrbz5qznSust
	ucWBEFZ3lekvZiXrqizFplYZF+LiG9TOGjhxujOJ+sIcCy0BCN4msb1/lguN username@My-MacBook-Pro.local
	```
3. SSH into CSIL (you can do this just by typing `csil` if you did the steps in the previous section). 
4. On the remote machine, navigate into the `.ssh` file and edit the `authorized_keys` file. This file may or may not already exist. Paste the copied public key from step 2 into the `authorized_keys` file. 

	Doing `cat authorized_keys` should print the same key in your local `id_rsa.pub`:
	```
	ssh-rsa
	AAAAB3NzaC1yc2EAAAADAQABAAABAQDYySoh7b1uGpI7saLozpgXz184YYgC9k22zLH8TqKiSLAcNCO5hEzgC0kZoytCMtw/hUx3kto8
	apPS4ORL6HebWXuGfzQ3nQslPpBNmto0hdo446wBu/Hl5a7pC3SZUzti4YbUjRDOBgM5zQMaopTXhtqNY/tRB8/lSSYaEtIxLN5twk29
	IQUoA2wdPTmU/fRPc3PUdD9/KHJfBIL/ROsOb73tGOxqZoMnzV0ElmLhjq6WEqNWypaFrI0YU8OmIvxmlDXn0gkr3oYHqrbz5qznSust
	ucWBEFZ3lekvZiXrqizFplYZF+LiG9TOGjhxujOJ+sIcCy0BCN4msb1/lguN username@My-MacBook-Pro.local
	```
5. Now when you SSH into CSIL, you shouldn't have to input a password! You can test this by opening a new terminal from your local machine and SSH-ing into CSIL. If you completed the previous step, you should be able to log into a CSIL machine just by typing in `csil` on your local machine. 
