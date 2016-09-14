---
topic: "$T and $B"
desc: "Using environment variables to make navigating a src tree less painful"
---


# Using `$T` and `$B` Environment Variables =

When using packages, it can be tedious to keep having to `cd` 
all the way down to the bottom of the directory tree, then all the way back to the top.

To make it easier to move around, define an environment variable called `T` like this.  
First, `cd` back up out of the `src` subdirectory, to the main directory of your project, the
one where the `build.xml` file lives.

Then use this command:

```
 export T=`pwd`
```

Note the special quote marks&mdash;we call them "backticks".  
This symbol might be at the upper left hand corner of the keyboard, under the ~, or somewhere else. 
It is not the same as the quotation mark&mdash;it points the other way.   
The meaning of backticks is to take the output of a Unix command (e.g. the pwd command) 
and insert it at that point on the shell's command line.

What the command  <code>export T=`pwd`</code> does is to define the environment variable T, 
give it the value of whatever your working directory (the output of <code>pwd</code>) happens 
to be at this very moment.  Any time you want to go there, just type <code>cd $T</code>&mdash;in fact, try that now:

```
 cd $T
```

Now, define `B` (for bottom) as the botton of the place where your source lives, like this:

```
 export B=${T}/src/edu/ucsb/cs56/w16/drawings/${USER}
```

Now, whenever you want to move into that directory, you can just type `cd $B`.  Try it now!

And, one more thing.  You probably want to "hang out" in the directory at the top of your project, i.e. `cd $T` because that's the place you have to be when you type `ant compile`, etc. 

But when you want to edit, you need to edit files that are down in the directory `$B`.  No problem&mdash;hang out in `$T`, but to edit, use commands such as:

```
 emacs $B/SimpleGui1.java
```

or

```
  vim $B/SimpleGui1.java
```

That way, you don't have to type those long terrible path names that Java packages require you to use&mdash;the `$T` and `$B` variables are saving you from having to do that.

Note that you'll have to redefine `$T` and `$B` for each login session, and each separate terminal window (well, each separate shell, actually.)  If you want them to stick around between logins, put the export command in one of your bash startup files.  Of course, they are different for each project that you are working on, so it's probably best to just redefine them for each session anyway.

Finally, another way to do this is just to have two Terminal windows open&mdash;one that stays in the `$T` directory, where you do all your ant commands, and another down in the `$B` directory where you do all your editing.

Or, use an [IDE](/topics/ides)

There is nothing special about the choices of the letters `T` and `B`.   I picked them because they are easy to type, and because `T` stands for Top and `B` stands for bottom.  If you want to use `R` for root, and `S` for source, that's ok too---or pretty much any other letter or environment variable name you want.   Don't use `PATH`, `USER`, or `HOME` though&mdash;those have special meaning.  In general, before defining an environment variable, its good to type <code>env</code> at the shell prompt and see which ones are already in use&mdash;and use one that isn't already being used.



