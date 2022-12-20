---
topic: "IDEs for C++"
desc: "Integrated Development Environments for C++ (CLion, Eclipse, Netbeans, etc.)"
---

## Short Version

Opinions vary on whether, in 2016, being competent with a traditional
text editor (vim or emacs) is a necessary skill.  

But there is also no doubt that there comes a time to also embrace
tools that can make you more productive.

The time to do that is when you already know quite a bit about what is
going on.

But when you do, you may want to try one of these IDEs:

* CLion
* [Eclipse](/topics/eclipse/)
* Netbeans

## And Now the Longer Version...

An Integrated Development Environment (IDE) is a software application
that facilitates development of programs. A typical IDE combines
powerful text editing capabilities with, source compilation and
debugging options. Somewhat more sophisticated IDEs provide more
advanced features such as source code auto-completion, static analysis
to detect logical errors in the code and source refactoring.  Even
more powerful IDEs may facilitate integration with version control
systems such as Git, integration with build systems such as Ant,
messaging and coordination among a team of programmers.

If used properly an IDE can greatly simplify the tasks associated with
programming. However, it is also best to keep in mind that using a
powerful IDE does not make you a good programmer. Programming is a
task that requires attention, careful application of theory and ardent
following of programming conventions and best practices. The IDE
cannot write code for you. It is simply a tool that takes care of some
of the more boring, routine tasks. So it is still up to you to write
good code, apply good design patterns, make good architectural
choices, document your classes and methods properly, and
write lots and lots of tests.

Having said that, here are some benefits of using an IDE for writing code:

* The standard libraries that come with C++ are large and complex.
     Remembering exactly what `#include` you need, what methods each
     object has, etc. can be a significant burden when working on large C++
     projects. An IDE can help you deal with this complexity by providing
     you with suggestions and source auto-completion.

* An IDE makes navigating through code a lot easier. Imagine a C++
    project with 2 classes (like the ones you coded for lab00 and
    lab01). When working on this project, you will often have to switch
    back and forth between the 2 classes and make changes. If you're using
    a regular text editor such as Emacs, you will have to switch between
    buffers regularly, search or scroll up and down a lot.  Now imagine
    working with a project with several dozens of classes. Clearly, the
    navigation between files, classes and methods is going to be a major
    pain point. An IDE usually makes jumping between classes and methods
    easier. In most IDEs you can just ctrl+click on an identifier to jump
    to its definition. They will also provide shortcuts to easily search
    and open C++ classes.

* Most IDEs incorporate a debugger where you can put breakpoints in
    the source code, and debug the program execution. When the executing
    program hits a debug point the program execution will be "frozen", and
    from there onwards you will be able to manually guide the program
    execution while inspecting the program stack and values of program
    variables.

Once you are familiar with C++ and OOP to some extent, you will embark
on more non-trivial programming projects. At this point it's a good
idea to start familiarizing yourself with an IDE, so you can give your
full attention to getting your design and code right. You can let the
IDE take care of some of the more mundane tasks associated with
programming. Indeed you should be fully capable of writing code using
a plain text editor such as Emacs or Vim. In your professional life
(in the industry or academia), you will often have to login to a
remote server via SSH and do some coding, in which case you have no
choice but to use a traditional command-line text editor. But when
working on a large-scale project on your own workstation, having an
IDE can save you a lot of time.

As stated earlier, some IDEs can also integrate with systems like
Git. Such IDEs allow you to commit and push code directly from the
IDE. But again, you should be fully capable of interacting with
version control systems and build management systems (e.g. Ant, Maven)
without IDE assistance. You will often have to work in environments
where an IDE is not available, and if you don't know how to work with
Git or Ant from the command line you will be in trouble. Also note
that when you offload matters such as version controlling and build
management to the IDE, you're actually giving up control over your
project.  As you get more comfortable with programming you will
realize that having more control over your project can be preferable
to the convenience provided by an IDE. Therefore, use IDEs carefully;
don't ever get too dependent on them.

### Some popular IDE Choices for C++

Here are some C++ IDES that you may want to consider:

* [CLion](https://www.jetbrains.com/clion/) From the same folks that make IntelliJ, RubyMine, PyCharm, and WebStorm
* [Eclipse](http://www.eclipse.org/home/index.php)
* [Netbeans](https://netbeans.org/)

Programmers (and sometimes organizations) are highly opinionated about which IDE is the 
best. So lets not open that can of worms here. You should do some research on different
IDEs, experiment with them and find what works best for you. If you're lucky you will 
get to keep using it at your professional life too. Something that often happens is
you form your opinion about which IDE is the best, and then you join an organization
whose corporate policy prohibits you from using your favorite IDE at work. Instead
you will be forced to work with an IDE that you are certain is inferior. This is 
another reason why you shouldn't get too dependent on any one IDE. You never know when
you will have to give up on your favorite IDE, and work with something else.

