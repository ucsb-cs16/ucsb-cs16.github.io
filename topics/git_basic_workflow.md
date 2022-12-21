---
layout: default
parent: Topics
title: "Git: basic workflow"
description: "The basics: git add..., git commit..., git push ... "
indent: true
---

This page describes the typical workflow that is used with git.

# The short version

This is explained in much more detail below, but is here at the top of the page for handy reference.

```
git pull
git add myfile.cpp
git commit -m "Describe what you did here"
git push origin master
```

In practice, its a good habit to do a `git status` in between each step, so in reality, it should look like this:

```
git status
git pull
git status
git add myfile.cpp
git status
git commit -m "Describe what you did here"
git status
git push origin master
git status
```

The rest of this page describes "what it all means".

# The details

The steps described below would be the same steps whether you were
working with Java, C, C++, Python, or even plain text files. These are
the steps that you'll want to get very accustomed to, because they
represent a typical "workflow" in git—the workflow you'll use when
working on an simple, single author, individual project.

Suppose you've made some changes to one of the files in your repository.
With luck, those changes worked.  At the very least, you want to make sure that
you don't lose your work, and that if you need to switch computers,
you can do that easily.

So it is important before we finish work
for the day to make sure we go through a "workflow" to get those
changes get "committed" and "pushed" to the github server.

Getting them on the github server means:
* You can pull the latest version of your code to any computer: your CSIL account, your laptop, your desktop, your friend's laptop&mdash;anywhere that you want to work.
* For public repos&mdash;or for private repos with appropriate sharing settings&mdash;your instructor, TAs, other helpers, and pair-partner/team collaborators can see your work online.  This makes it easier to ask questions.  If you go into office hours, you can bring up your code right in a web browser and ask questions about it.
* You have a backup copy of your code "in the cloud" in case you accidentally lose all the files in your CSIL account, in case your laptop hard-drive crashes, etc.

Ok, first let's learn some terminology.  Then let's learn how to do the usual git basic workflow.


### What's a *workflow*? What's a *commit*? What's a *push*?

The word **workflow** is often used to describe a typical sequence of
steps you go through to interact with a version control system to use
it effectively. In particular, it describes how the use of the tool
fits in with the other parts of software development that you are
already used to, such as editing code, compiling code, and testing
code.

As you make changes to a repository—adding/deleting files or
directories, renaming files, editing files—at a certain point, you
should periodically **commit** those changes.

When should you commit? Often. Typicallly, after each edit or set of
edits that successfully accomplishes some goal, however small.

- Get in the habit of committing any time you have improved your code
    in some way (e.g. you've added a few lines of code or some
    comments, and the code compiles, and nothing that was working
    before is now broken.)

It is typically NOT a good practice to commit changes that make the
code "worse" (e.g. break something or cause it to no longer
compile). This is especially true in projects with multiple developers
(the rule is sometimes called "don't break the build").

But that's not a hard-and-fast rule. It depends on the situation. For
now, I'd suggest you err on the side of committing TOO often, rather
than the other way around. The idea of a commit is that it is a
checkpoint that you can roll back to if necessary. Any commit can be
"undone".

And as long as you **push** your commits to the github.ucsb.edu server
in the cloud, you'll be able to recover every commit you've ever made,
even if the system where you are working (e.g. CSIL) is wiped out by a
fire, earthquake or tsunami (along with all the CSIL backups.)

**The difference between a commit and a push** is this:

-   in general, a **commit is local**
-   a push copies the **results of a commit to a remote server**.

To understand this, you need to understand what happened when you did
the first "git clone" command of your repo onto your CSIL account (or your own laptop computer.)

To start with, your repo existed in only one
place: on the github.com or github.ucsb.edu server.

Then you cloned it with "git clone" into a subdirectory of your ~/cs56
directory on your CSIL account (or laptop). Now there are TWO
repositories, not ONE.

That's worth repeating: after you clone a repository, you now have TWO
SEPARATE REPOSITORIES. For example, this in case:

-   a REMOTE repository called that lives on github (git calls this the "origin master")
-   a LOCAL repository called that lives in your current directory.

When you "commit" a change, you are committing it in your LOCAL copy of the repository.

When you "push" that commit, you are updating the REMOTE copy on github.

Ok, now that we've talked through what we are about to do, let's actually do it.

# Do a `git` `pull`

Normally, if we were working with other people, or perhaps doing work on more than one system (e.g. sometimes working on our laptop, sometimes our desktop machine at home and sometimes on CSIL), the first step before doing a commit is always to do a `git` `pull`. The `git` `pull` command ensures that we get the latest updates from elsewhere, in case there are any.

In this case, we probably don't need to do that, because we've just been working with this one clone of this one repo, but just because we want to establish a good set of habits, let's start with the `git` `pull`. You'll have to type in your github username and password for this step.

    -bash-4.2$ git pull
    Username for 'https://github': bnieder
    Password for 'https://bnieder@github': 
    Already up-to-date.
    -bash-4.2$ 

The git pull is necessary when you (or someone else) has made changes to the repo on github on *some other computer*, or by editing directly on the github web page.

If you have NOT done this, the message "Already up-to-date" is most likely what you will see.

It is possible at this point to have a so-called *merge conflict*.   Those are usually not *nearly* as difficult to deal with as
they may seem, but that is a whole other topic, so there is a separate page for that: [git: merge conflicts](/topics/git_merge_conflicts)

# `git status`

The next step before committing a change is to use the `git` `status`
command to see what's up. Specifically, we need to see which files may
have changed since the last commit, and decide which of those changes
we want to make part of our commit. This command doesn't require us to
type our github username and password (i.e. our CSIL
username/password) because it is ONLY checking the current files in
our directory against the "last" commit that we did—or if we have not
done any commits yet, against the version that was in place when we
originally cloned the repository. That's something that can be done
ENTIRELY on the local file system.

Remember:

-   A commit is typically a LOCAL operation—it doesn't touch the server.
-   A pull or a push is typically an operation involving the SERVER, and we have to authenticate with a username/password.

There are exceptions to those rules, and later things may get more complicated, but that explanation is a reasonable starting point.

Here is what a git status looks like:

    -bash-4.2$ git status
    On branch master
    Your branch is up-to-date with 'origin/master'.

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

            my_program.cpp

    nothing added to commit but untracked files present (use "git add" to track)
    -bash-4.2$    

The message here shows that we've made a change to `my_program.cpp` that hasn't been committed.

To tell git that we want this file to be part of our commit, we use the command "git add", which is the next step.

# Use `git` `add` to add files into the commit

Nothing goes into a commit unless we specifically tell git we want it to be a part of the commit. The git status command can be used to tell us what we might want to add to the commit, but ultimately, it is up to us to make this choice.

Type the following: `git add my_program.cpp`

It should look like this:

    -bash-4.2$ git add my_program.cpp
    -bash-4.2$ 

It typical 'unix command" fashion, there is no output, which means "it worked." But if we want to really see that it worked, we can type "git status" again:

    -bash-4.2$ git status
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #   modified:   my_program.cpp
    #
    -bash-4.2$ 

Now we see that when we do our next commit, `my_program.cpp` will be part of the commit. So, let's do that now.

# Use `git` `commit` `-m` `"some` `message` `here"`

This will to commit these files to the LOCAL repository (the one in our CSIL directory.)

When we commit, we need to add a message that describes what change we made to the file. These are typically short. For example, in this case our message might be:

    Added Comment

So type this command: git commit -m "Added Comment"

Here's an example:

    -bash-4.2$ git commit -m "Added Comment"
    [master 7180ef4] Added Comment
     1 file changed, 7 insertions(+), 1 deletion(-)
    -bash-4.2$ 

Note that there is a hex number that goes with the commit—in this
case, 7180ef4. That hex number is the first few hex digits of the
SHA-1 Hash of the contents of the entire repository, and is the
identifier by which this commit is known to the git system. Those
numbers will be important later. For now, just notice that each time
you commit a change, this hex number changes.

<http://i.imgur.com/lJQ26Fm.png>

**Help! I tried the commit command and my screen went all weird!**

If you see something like the picture at right when doing a commit
command, it means you forgot the -m, or somehow the -m got messed up.

So, the git commit command put you in the vi editor so you could
finish typing the message. This is all well and good if you know how
to edit in vi. In that case, just type your commit message, then type
escape, and use **:wq** to save your changes. Then your commit will go
through just fine.

But if you don't know how to edit in vi, you are likely to be very
confused. To get out, just type escape, then **:q!**

Then try your commit again.

### Step 6e: Use `git` `status` to see the status now

It you now type git status, you'll see this message. Read it carefully
(it helps if you read it out loud.)

    -bash-4.2$ git status
    # On branch master
    # Your branch is ahead of 'origin/master' by 1 commit.
    #   (use "git push" to publish your local commits)
    #
    nothing to commit, working directory clean
    -bash-4.2$ 

The important part here is that you are being told that you need to
git push to "publish" your local commits. That is, your commits are
currently only in your local repository. When you "publish" them, you
push the back to the "origin/master" branch of your repository at
github—which is the one that your instructor and/or TA will look at to
give you a grade.

So, let's push the changes there, because you certainly want your instructor/TA to see the results of all your hard work!

# Use `git` `push` `origin` `master` to push the changes to github

Type "git push". In this case, this is short for "git push origin
master", which means "push all my local changes up to the master
branch at the origin of this repository, the main repo at github".

Here's what that should look like. Note that you'll need to type your
github username and password again (which again, is your CSIL
username/password), since you are updating content on the server.

    -bash-4.2$ git push origin master
    Username for 'https://github': bgaucho
    Password for 'https://bgaucho@github': 
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 563 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To https://github/UCSB-CS56-W16/cs56-w16-lab00.git
       2d598d9..7180ef4  master -> master
    -bash-4.2$ 

**Am I really going to have to type in my CSIL username and password so often!?**

For right now, every time we do one of these git commands, we have to
type in our CSIL username and password. That's going to get old real
fast. Fortunately, there is an easier way: we can [use SSH public/private keys with github](github_ssh_keys) to make things easier.


# Seeing the effect on github

<http://i.imgur.com/516g3rN.png>

Until you do the git push command, if you go to your repo on github,
the changes you make aren't there. But now, your changes will be
there.

Go to the github page for your repo.

You should see something like the image at right. You should see the
commit message you put in after -m on the git commit command. Also,
try clicking on the file, and you should see the changes in your code
there.

# So what's the big deal?

This may not seem very exciting at this point---you may wonder what
all the fuss is about. And to be clear, the value of all this isn't
really very apparent when we are dealing with one person making one
change in one file. But, as we work with this over the weeks ahead,
with much larger projects, the benefits will become clear. So, be
patient and stay tuned.

