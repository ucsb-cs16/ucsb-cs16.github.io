---
topic: "Java: Annotations"
desc: "All about those funny @ things that precede methods"
---

According to [this lesson on Java Annotations](https://docs.oracle.com/javase/tutorial/java/annotations/) from the Oracle website (retrieved 2016-06-20):

> Annotations, a form of metadata, provide data about a program that is not part of the program itself. Annotations have no direct effect on the operation of the code they annotate.
>
>Annotations have a number of uses, among them:
>
> * Information for the compiler — Annotations can be used by the compiler to detect errors or suppress warnings.
> * Compile-time and deployment-time processing — Software tools can process annotation information to generate code, XML files, and so forth.
> * Runtime processing — Some annotations are available to be examined at runtime.

Some of the annotations that we commonly see in CMPSC 56 include these that are built into Java 8:

* pre-defined annotations, `@Override`, `@Deprecated` and `@SuppressWarnings` (more info below).
* the `@FunctionalInterface` annotation, used with [Java 8 Lambda expressions](/topics/java_lambda_expressions/).

And these that are part of [JUnit](/topics/junit/):

* `@Before` for setup functions ([`org.junit.Before` javadoc](http://junit.sourceforge.net/javadoc/org/junit/Before.html))
* `@Test` for unit tests [`org.junit.Test` javadoc](http://junit.sourceforge.net/javadoc/org/junit/Test.html)
* ... and others.  For more information, consult the [JUnit](/topics/junit/) page of this site.

# Three pre-defined annotations: 

See also, [Oracle lesson on pre-defined annotations](https://docs.oracle.com/javase/tutorial/java/annotations/predefined.html)

* `@Override`, used to indicate that the author intends the current method to override a method of one of the ancestor classes.  
  Although use of `@Override` is optional, a benefit is that if the author gets the method signature wrong (number/type of params, and/or
  return type), the compiler may give the programmer a warning.   In that case, you might be defining a new method that
  is perfect legal from a syntax point of view, but doesn't have the effect you intend.   Without `@Override`, the compiler can't
  warn you that your method isn't actually overriding anything.  Your code has a problem, but you won't know unless testing reveals it.
  
* '@Deprecated` is used to indicate that a certain method is one that programmers should try to avoid using in new code, because it may go 
  away in a future release.   You might use `@Deprecated` if you are trying to refactor some legacy code and want to remove a particular method.  
  Marking it as deprecated will allow you to see a compiler warning each time it is used, so that you can, over time, systematically
  eliminate all uses of it from your code base, replacing it with some better method, while continuing to have the code work in the meantime.
    
* `@SuppressWarnings` is used to supress the warnings that the compiler generates about some  
  
# FunctionalInterface 

The `@FunctionalInterface` annotation is typically used with Java 8 Lambda Expressions.  For more information, see [Java 8 Lambda Expressions](/topics/java_lambda_expressions/).

