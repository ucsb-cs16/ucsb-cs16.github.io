mac.md
---
topic: Mac OS
desc: "Setting up an environment to do CS56 work on your own Mac (not ssh'ing into CSIL)"
---

For certain kinds of programs, i.e. graphics, and especially sound, 
it may be more convenient to work directly on your Mac rather than 
ssh'ing into CSIL.

For audio or sound programs, this is especially true.

What do you need to install on your Mac to be able to do this?

# Install the JDK

To see whether you already have the JDK installed, do this in a terminal window:

```
169-231-88-206:~ pconrad$ javac -version
javac 1.8.0_31
169-231-88-206:~ pconrad$ 
```
If you see some version of Java 1.8.something... then you are good to go.

If not, download and install a version for Mac OS from here:

<http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html>

# Install Apache Ant

Next, see if you have Apache Ant installed:

```
169-231-88-206:~ pconrad$ ant -version
Apache Ant(TM) version 1.9.7 compiled on April 9 2016
169-231-88-206:~ pconrad$
```

If instead, you get `command not found`, then install Apache Ant by following the instructions here:

<https://www.mkyong.com/ant/how-to-apache-ant-on-mac-os-x/>
