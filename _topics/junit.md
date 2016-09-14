---
topic: "JUnit"
desc: "Unit testing framework for Java"
---

JUnit is a unit testing framework for java.  It supports the practice of [Test Driven Development (TDD)](/topics/test_driven_development).

This page focuses more on JUnit as a piece of software: how to set it up, the syntax and semantics of its features, etc.

For more information on the approaches to testing in general, see the [TDD](/topics/test_driven_development) page on this site.

# References


# JUnit Annotations

Several [Java Annotations](/topics/java_annotations) are used by JUnit.  Some of the most commonly used include:

* `@Before` for setup functions ([`org.junit.Before` javadoc](http://junit.sourceforge.net/javadoc/org/junit/Before.html))
* `@Test` for unit tests [`org.junit.Test` javadoc](http://junit.sourceforge.net/javadoc/org/junit/Test.html)

# Testing for Exceptions

If your code is supposed to thrown an exception under some circumstance, this is something you should test.  For example, if a constructor for a rational number shown throw an `IllegalArgumentException` when the denominator is zero, you should test for that.

The easiest way is to use a parameter to the `@Test` annotation, as illustrated here:

```Java
   @Test(expected = IllegalArgumentException.class)
   public void test_denom_zero() {
      Rational r = new Rational(1,0);
   }
```

This only tests whether the expected exception is thrown. If you want your test to be more specific&mdash;for example, to check whether the content of the message in the exception object matches some expected text, there are more sophisticated techniques that can be used.  Those are explained in the following article from the junit-team's wiki:

* [Tutorial on JUnit Exception testing](https://github.com/junit-team/junit4/wiki/Exception-testing)
