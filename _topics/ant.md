---
topic: Ant
desc: "Apache Ant, a build tool for Java (similar to Make/Makefiles)"
---

TODO: Migrate content from [56 wiki ant page](https://foo.cs.ucsb.edu/56wiki/index.php/Ant to this page)
at [this edit link](https://github.com/UCSB-CS56-pconrad/UCSB-CS56-pconrad.github.io/edit/master/_topics/ant.md)

In the meantime, consult that page as a reference as well.

# The short version:

* Ant is similar in purpose to Make/Makefiles for C/C++

# Differences between Ant and make

* XML syntax instead of ideosyncratic Makefile syntax (tabs? what?)
* Built in Java, so its ostensibly portable like Java (Makefiles are very Unix centric)
* You control your project with a file called `build.xml` instead of `Makefile`
* You type `ant` instead of `make`, or, for example: 
    * `ant compile` instead of `make executablename`
    * `ant clean` instead of `make clean`


# References:

* [Ant Users Manual](https://ant.apache.org/manual/)
* [Ant Tutorial (Hello World)](https://ant.apache.org/manual/tutorial-HelloWorldWithAnt.html)
* [Wikipedia page for Apache Ant](https://en.wikipedia.org/wiki/Apache_Ant)
* [List of Ant Tasks](http://ant.apache.org/manual/tasksoverview.html ) from Apache Ant website

# Tutorials

* [Writing a Simple Buildfile](http://ant.apache.org/manual/using.html) from Apache Ant website.

# Installing
* [Ant Download Page](http://ant.apache.org/bindownload.cgi)
* [Installing Ant on Mac OS X](http://stackoverflow.com/questions/3222804/how-can-i-install-apache-ant-on-mac-os-x) 
    * NOTE: Use Instructions for Manual Install

# How do I...? 

## Factor out my classpath? 

The following assumes you have a `build` subdirectory with your classes, and a lib subdirectory with a `.jar` file
for JUnit.  (Note: to get a `.jar` file into a git repo that has a `.gitignore` file for Java may require the `-f` flag on the `git add` command.)


```
  <path id="project.class.path">                                                               
         <pathelement location="build"/>                                                       
         <pathelement location="lib/junit-4.8.2.jar"/>    
  </path>
```

Using it:

```
 <java fork="true" classname="${fullPkg}.${mainClass}" >
     <classpath refid="project.class.path" />   
  </java>          
```

# Get non-code resources into my JAR file ==

e.g. images, configuration files, sample data, etc.

http://stackoverflow.com/questions/1216744/adding-non-code-resources-to-jar-file-using-ant

# access non-code resources in my JAR file 

If you have images or files in your JAR, you may need to get to them from your code.

You can't do this the normal "file system" way.  Instead, there are alternative methods.

http://stackoverflow.com/questions/2393194/how-to-access-resources-in-jar-file

# Common Problems 

## "Modified in the Future"

*Q:* I get the message "Warning: file foo.bar modified in the future". What's up with that?

*A:* The system you are running on&mdash;be that csil.cs.ucsb.edu, or one of the cartoon characters in the physical CSIL lab, or one of the machines in Cooper lab&mdash;may have a clock that is a few milliseconds off from the clock on the file server.   This causes ant some grief. Usually this message can be ignored.

If you really get bothered by it, there is some code here you could perhaps adapt to force the time stamps to be the ones you want. No guarantees if this will work though.

http://jawe.net/wiki/dev/ant/anttouchfuturefiles

Best bet: don't worry&mdash;be happy.

# includeantruntime warning 

*Q:* When I compile with ant, I'm getting this crazy warning (see below) on the `javac` step. What's up with that?

 warning: 'includeantruntime' was not set, defaulting to build.sysclasspath=last; set to false for repeatable builds

*A:* The quick answer is that you can usually fix this by just adding `includeantruntime="False"` to your `javac` step.

For example, change:

```
<javac srcdir="${dir.src}" destdir="${dir.build}" includeantruntime="False" >
```

to:

```
<javac srcdir="${dir.src}" destdir="${dir.build}" includeantruntime="False" >
```

The reasons for this are sort of obscure and have to do with an "improvement" to Ant that led to more predictable behavior---but involved a tradeoff between backwards-compatibility, and inconvenience going forward (i.e. having to put this magic incantation on every <code>javac</code> line. If you are deathly curious, a more detailed explanation can be found at this link.

* <http://ant.1045680.n5.nabble.com/warning-includeantruntime-was-not-set-td2639463.html> 

# I get "(Unknown Source)" in my stack traceback messages 

*Q:* I'm trying to debug my code, and I'm getting an exception. Weird thing is, the JVM seems to know the exact line numbers inside the system classes, but not in my own code.  I'm getting "(Unknown Source)" next to my own code. What's up with that?  I'd really like to know where the exception is being thrown. Here's an example of what I'm getting:


```
    [junit] java.lang.StringIndexOutOfBoundsException: String index out of range: 0
    [junit] 	at java.lang.String.charAt(String.java:694)
    [junit] 	at UCSBBuildingCodeTable.setUpHashTable(Unknown Source)
    [junit] 	at UCSBBuildingCodeTable.<init>(Unknown Source)
    [junit] 	at UCSBBuildingCodeTableTest.test1(Unknown Source)
```

How can I fix this so that I can see the file and line number where, for example, setUpHashTable is being called?

*A:* Inside your build.xml file, on the line that does the javac task, include these attributes: 

```
<code>debug=true debuglevel="lines,source"</code>.
```

As an example, here's before:

```
<javac srcdir="src" destdir="build" includeantruntime="false" >      
```

Here's after:

```
<javac srcdir="src" destdir="build" includeantruntime="false" debug="true" debuglevel="lines,source">      
```

Then you should more helpful output like this:

```
    [junit] java.lang.StringIndexOutOfBoundsException: String index out of range: 0
    [junit] 	at java.lang.String.charAt(String.java:694)
    [junit] 	at UCSBBuildingCodeTable.setUpHashTable(UCSBBuildingCodeTable.java:138)
    [junit] 	at UCSBBuildingCodeTable.<init>(UCSBBuildingCodeTable.java:51)
    [junit] 	at UCSBBuildingCodeTableTest.test2(UCSBBuildingCodeTableTest.java:58)
```

Remember that you might need to do `ant clean` to force a recompile before you run again&mdash;otherwise, this change to your javac task won't make any difference.

## My problem isn't listed here!


*Q:* My problem isn't listed here!

*A:* Try googling the error message, or check here: http://bobcat.webappcabaret.net/javachina/faq/ant_01.htm

