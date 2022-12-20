---
topic: Eclipse
desc: "One of several choices for a Java IDE"
---

This is a work in progress. Revisit this page time to time check for updates.

## Installation

Your lab machines already have Eclipse (v4.5 Mars) installed on them. Just check under the "Programming"
section in the main menu. CSIL machines also have a version of Eclipse on them, which you can launch
in a similar way. Note that Eclipse is a GUI application. Therefore you must be directly working on 
these lab machines to launch and interact with Eclipse. You cannot use Eclipse over SSH. Keep reading
if you're going to install Eclipse on your own laptop/machine.

**Note: Rest of the instructions under this "Installation" section assumes that you're familar with your OS,
the command-line interface and you're comfortable working with files and directories.**

### Download and Install Java

Eclipse is written in Java, and therefore you need to have Java already installed to be able to run
Eclipse. To check if your machine already have Java installed on it try running `java -version` and `javac -version`
in a terminal. You should get some output indicating your Java version in "both" cases. If any
one of these commands fail to execute, you need to install Java.
Grab the latest version of Java Development Kit (JDK) from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). 
Note that you need Java Development Kit (JDK), NOT Java Runtime Environment (JRE). Make sure
to download the package appropriate for your OS. You will need to click on the "Accept License Agreement"
radio button to be able to download a JDK package.

Installing Java should be fairly straight forward. On Windows you can run the downloaded *.exe file.
On OS X, just launch the downloaded *.dmg file to fire up the installer. On Linux simply extract the 
downloaded *.tar.gz file. On Linux you might also have to update the $PATH environment variable to
include the "bin" subdirectory of the JDK installation. We don't intend to provide complete step-by-step
instructions for installing Java here. If you run into any issues, Google is your friend. An example
query is "how to install java on osx el capitan". Some additional help is also available 
[here](https://www.java.com/en/download/help/download_options.xml). 

### Download Eclipse

Go over to the [Eclipse Downloads](http://www.eclipse.org/downloads/eclipse-packages/) 
page, and download the "Eclipse IDE for Java EE Developers". Alternatively you can also download
the more lightweight "Eclipse IDE for Java Developers". The former provides additional features which
are mostly useful when working on advanced Java projects involving web services and other
enterprise features (EE stands for Enterprise Edition).

When downloading make sure you grab the package appropriate for your OS. They have separate distributions
for Windows, Linux and OS-X. Usually Eclipse download page shows you the appropriate distribution by detecting
your OS. If it doesn't work as expected, look for a dropdown box at the top of the page
where you can choose the correct OS.

### Installing Eclipse

Exact installation steps will depend on your OS. Most of the time it's just a matter of extracting
the downloaded archive. On OS-X, copy the extracted Eclipse directory to ~/Application directory
so that you can access Eclipse from the OS-X Launchpad. On Linux you might want to add Eclipse
to the $PATH environment variable, so that you can launch it easily from the terminal. On Windows
you might want to create a desktop shortcut to the eclipse.exe in the extracted installation 
directory. 

Refer the Eclipse [installation guide](http://wiki.eclipse.org/Eclipse/Installation)
if you encounter trouble.


See also: [IDEs](/topics/ides/)
