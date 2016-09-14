---
topic: "Java: JAR files"
desc: "Creating and using .jar files"
---

A `.jar` file is a *Java Archive*.


# Java `.jar` files vs. C/C++ linking

There is one superficial aspect in which creating a `.jar` file in Java and linking C/C++ are similar: that is,they allow us to combine the artifacts
of separately compiled units of software (`.class` files in Java, or `.o` files in C/C++) into a single unit that is executable.

We should look beyond this superficial similarity to see some important differences.

There is no *linking* phase in Java as there is in C/C++.  In C++, part of linking is turning resolving symbolic addresses of variables and
functions into offsets.  These offsets become virtual addresses during loading.  In Java, the analogous activities happen
at run time, and are taken care of *at run time* by the [Class Loader](https://en.wikipedia.org/wiki/Java_Classloader) and the Java Virtual Machine (JVM),
and are handled very differently from in C/C++.

Instead, what happens when creating a `.jar` file is that we combine a set of `.class` files into what is essentially just a glorified `.zip` archive plus a
bit of metadata called a [*manifest*](https://docs.oracle.com/javase/tutorial/deployment/jar/manifestindex.html).  The manifest can specify,
among other things, which of the .class files in the .jar contains the `main()` method that should be executed when the `.jar` file
is "executed".

One important difference here is that while a compiled C/C++ program must contain exactly one main (no more, and no fewer), a Java .jar file 
can contain 0, 1 or many classes with main() methods.   

* If some jar file `foo.java` contains no classes with main() methods,  then you can't specify a main method in the manifest, 
  and you can't, therefore, write `java -jar foo.java` and expect a program to run.
* If some jar file `foo.java` contains exactly one class 'Bar' with a main() methods,  and if you specify that class in the manifest, 
  `java -jar foo.java` will run the main from class 'Bar'.
* If some jar file `foo.java` contains exactly many classes 'Bar,Fum,Baz, etc.' with main() methods, you may specify one of them, say,
  `Bar` in the manifest as the default main, and when you run `java -jar foo.java`, that main will run.  But, you can also run
   the other main methods via: `java -cp foo.java Fum`, or `java -cp foo.java Baz`, etc.  In this case, you are putting `foo.jar`
   into the classpath, and then specifying the class you want to run.  You can also use this method if the .jar has a single class 
   with a `main`, but that class is not specified in the manifest.
  
# References

* <https://docs.oracle.com/javase/tutorial/deployment/jar/index.html>
* <https://docs.oracle.com/javase/tutorial/deployment/jar/manifestindex.html>
