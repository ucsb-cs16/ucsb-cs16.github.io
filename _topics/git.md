---
topic: "git/github: overview"
desc: "An introduction. git vs. github.com vs. github.ucsb.edu, repos, etc."
---

A few basics facts about git, github.com, and github.ucsb.edu
----------------------------------------------------------------------------

In addition to learning C++, one of the major goals of this course is to get really comfortable\
 with "version control", using a tool called "git" and a website called "github.com", and one ca\
lled "github.ucsb.edu". Our first step is to "clone a github repo".


### What is git and what is a repo?

The software package "git" is an example of a "version control system". (Others include SVN, Mercurial, and in a previous generations, CVS, RCS, and SCCS).

A git repo (short for repository) is nothing more than a collection of files and directories (folders), along with a special subdirectory called .git (stored only once in the top level directo\
ry of the repo) that keeps track of the complete history of the files and directories contained in the repo. To some extent, the ".git" directory stays out of your way, and you use the files a\
nd directories in the repository exactly the same way you'd use files and directories in a regular directory.

On the other hand, keeping files in a git repository has many advantages:

-   making it easier to collaborate with others on a project (whether that's an open source or closed source project)
-   making it easier to recover from screwups (like deleting important files, messing up code that was previously working, complete failure of your hard drive)
-   making it easier to share "works in progress" with TAs and instructors and fellow students to get help during lab, office hours, or by email
-   making it easier to share "open source" projects with others on the internet.

### What is github.ucsb.edu and github.com, and how do they differ from git?

A git repository can be local, on your file system, or it can be
remote on a server somewhere on the Internet. (We might say, using
terminology that is trendy these days, that a repo on the internet is
"in the cloud" if we get to remain blissfully ignorant of exactly how
that service is being provided to us—i,.e. someone else is worrying
about all the system management issues like keeping that server up and
running, keeping it free of malware and defending from Denial of
Service attacks, managing backups, etc.)

The github.com company is a commercial enterprise that runs a website
called github.com. Github.com provides a service for hosting github
repositories "in the cloud". The github.com company hosts open source
projects for free (via free public repositories) and makes money by
charging uses for hosting closed source projects in private
repositories.

In addition github licenses its software to various organizations that
want to set up their own private "github" like servers within their
enterprise. UCSB licensed this software and set up a github server
called github.ucsb.edu that is based on your CSIL account.

We may use github.com for some assignments and github.ucsb.edu for others.
