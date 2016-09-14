---
topic: "Java: Command Line Arguments"
desc: "how to the access contents of (String [] args)"
---


* Use `args.length` to determine how many command line arguments there are.   
* Unlike in C/C++ and many other languages, the [0] element is not the class name, program name, or anything special.  It is really the first argument.
    * So if you run `java Main` then args.length is really `0`
    * If you run `java Main foo bar fum` then args.length is `3`, args[0] is `"foo"`, args[1] is `"bar"`, and args[2] is `"fum"`
    
# Conversion to numeric values

Command line args come in as Strings.  

If you want an `int`, use `Integer.parseInt` as in this example from [Oracle's tutorial](https://docs.oracle.com/javase/tutorial/essential/environment/cmdLineArgs.html)

```Java
int firstArg;
if (args.length > 0) {
    try {
        firstArg = Integer.parseInt(args[0]);
    } catch (NumberFormatException e) {
        System.err.println("Argument" + args[0] + " must be an integer.");
        System.exit(1);
    }
}
```

There are similar techniques for `float`, and `double`.


# References

* <https://docs.oracle.com/javase/tutorial/essential/environment/cmdLineArgs.html>
