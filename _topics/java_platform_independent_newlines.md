---
topic: "Java: Plaform Independent Newlines"
desc: "\n isn't as portable as you might like"
---

## The short version

The `"\n"` character represents a newline on some systems, but other systems have different newline conventions.

For more portable Java code, instead of hard coding `"\n"` in your strings, use either:

```Java
  String nl = System.getProperty("line.separator");
```

or, use the `%n` format specifier to get a system-independent newline.

Note that some sources suggest that on System.out and System.err it really doesn't matter; that the lower layers of Java plumbing will take care of the problem.

## References

* <http://www.leepoint.net/io/10file/sys-indep-newline.html>
* <http://stackoverflow.com/questions/3963582/getting-the-new-line-character-without-system-getpropertyline-separator>
* <http://stackoverflow.com/questions/207947/how-do-i-get-a-platform-dependent-new-line-character>
