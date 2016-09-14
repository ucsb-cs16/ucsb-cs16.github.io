---
topic: "Java: static analysis"
desc: "Tools that analyze source code without running it"
---

Let's start with the definition of static analysis, and then a pragmatic definition.

Definition: static analyzers are programs that tells us something about some program's source code without running it.   

The errors and warnings from a compiler are a kind of static analysis, but we typically only talk about static analysis of
syntactically correct programs.  So, really lets thrown out the "error messages" that cause you to not be able to even run
your program, and we'll start with this:

* If you've ever compiled a program that has no errors&mdash;you get runnable code&mdash;but *does* have warnings at compiler time&mdash;
  then you've seen some of the messages you can get from static analysis.
* The compiler did not *run* your code, but it did run an algorithm that detected that your code might have some kind of problem.
  Perhaps you have a variable that is initialized but then never used, or there is a variable that is used but never initialized.

It turns out that static analysis can do many more things than just what you see in the warning messages of the compiler.    It may not do 
all of the following things "perfectly", but it can be quite helpful.

Static analysis can:
* Check for test coverage.  How much of your code is covered by your JUnit tests?   We can ask a program to figure that out.
* Check for duplicate code.  Is there code that you copied/pasted, figuring "I'll refactor that later into a common method" so that
  I'm not repeating myself."  We want our code to be DRY, as in **D**on't **R**epeat **Y**ourself).   Static analysis can find 
  these sections automatically.
* Check for simple style violations.   Is our indentation inconsistent?  Have we followed the usual practices regarding capital vs. lowercase
  letters?   Do we have lines of code longer than 80 or 120 columns?   Do we have a method that is longer than a screenfull of text,
  that should perhaps be refactored into multiple methods for readability?
* and much more.

# How can I run static analysis on my Java code?

One tool that you can use for open source projects in Java is called [Codacy](java_codacy.md).  Click the link to learn more.

For languages other than Java, see: [pconrad-webapps static analysis](http://pconrad-webapps.github.io/topics/static_analysis/)
  
# Some theory: the halting problem.

Static analysis tools examine your source code without actually running it.

We know from the proof of the halting problem (a topic of CMPSC 138) that it is no algorithm to predict with 100% accuracy whether
a given program will terminate or not (i.e. whether it has an infinite loop or not.)    

This is a barrier to many types of analysis we might do that involve running the code&mdash;there is no guarantee that the process will
ever terminate with an "answer".

Static analysis typically involves running some algorithm over the code that has a predictable running time and will definitely
terminate with an answer, ideally something like O(n) where n
is the length of the file&mdash;certainly something bounded by a polynomial running time.
