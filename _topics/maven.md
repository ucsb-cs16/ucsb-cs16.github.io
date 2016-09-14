---
topic: Maven
desc: A build tool for Java plus a package manager
---

The short version:

* Maven adds package management to the functions that you get with Ant.
* By package management, I mean that instead of you having to manage the process of obtaining all the .jar files for third party library that
  your project may depend on (and the .jars that *those* files depend on, and so on...), maven manages that for you.

Similarities with Ant:

* Both Ant and Maven provide a way to manage the process of compiling, making jars, producing javadoc, running your code.
* Both use XML as the format
* Built in Java, so its ostensibly portable like Java (Makefiles are very Unix centric)
* Both are maintained by the Apache Software Foundation

Differences between Maven and Ant:

* `pom.xml` instead of `build.xml`
* command to run the tool is `mvn` instead of `ant`
* The directory structures for Ant is somewhat flexible, but Maven has definite expectations.  
    * With Ant, you can decide how to organize your directories, and configure your build.xml file accordingly
    * With Maven, you need to do things Maven's way, or you'll be sorry.    We'll ok, so strictly speaking
      [that's not true, according to the Maven FAQ](https://maven.apache.org/general.html#dir-struct), but it certainly
      is easier to just organize things according to the Maven defaults.
* The pom.xml syntax is a bit more complicated than the build.xml syntax (okay, that's a personal opinion)
    * But, you get more power, so it's perhaps worth it?
* Maven will manage a lot more things for you than Ant does, including downloading and caching the .jar files your 
  application needs.
     * You still have to specify what .jars those are in `dependency` declarations in the `pom.xml` file.

# References:

* [Apache Maven home page](https://maven.apache.org/)
* [Apache Maven FAQ](https://maven.apache.org/general.html)
* [Apache Maven in 5 minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)    
