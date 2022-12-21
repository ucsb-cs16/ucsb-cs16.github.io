---
layout: default
parent: Topics
title: "C++: data types"
description: "int, float, double, etc."
---

Before we can even begin to talk about how to compute something, we
need to know how to represent data.

# The basic idea of data types

Since CS16 is NOT your first programming course—if it is, you are in
the WRONG class—I am assuming you already understand that programming
languages have various data types for things like:

|type                                                                   |examples |
|-----------------------------------------------------------------------|---------|
| integers                                                              | 3, -42, 0 |
| real numbers (i.e. numbers with a decimal point that may or may not be integers) |  3.14159, -2.5, 4.0 |
| strings | "UCSB", "deadmau5", "4+4" |
| groups of things (arrays, lists, structures, tuples, objects) | `{ "UCSB", "UCLA", "UCSD" }`, `{ "Chris Gaucho", 1234567, 3.57 }` |


If you are saying, well, of course—I remember that idea from the last
programming class I took&mash;then: good. We can build on that
knowledge, even if its a bit fuzzy, to explain data types in C++. If,
on this other hand, this idea is brand new to you, then you don't
really have the background to be in CS16, and you should consider
starting in CS8, or doing some review on your own.

# Basic C++ data types

Most introductory C++ textbook takes a LONG time to introduce enough
data types for the programs we can write to actually get interesting.
Way too long. In particular, our textbook (Savitch 9th Edition)
introduces the following common C++ data types in the chapters shown
below. As you can see, it takes a long time to get to arrays and
structs. We want to get to them much sooner, so we are going to skip
ahead with at least a basic introduction to arrays and structs.

The data types in this table are ones you absolutely SHOULD know, and
even memorize, since they are needed all the time when writing code in
C++.

| type of data       | C++ keyword (or syntax)| examples           | textbook section   |
|--------------------|---------------------|--------------------|--------------------|
| integers           | `int`               | 3, -42, 0          | briefly in 1.3; longer discussion in 2.3  |
| real numbers       | `double`            | 3.14159, -2.5, 4.0 | briefly in 2.1; longer discussion in 2.3  |
| strings | `string` or `char *` | "UCSB", "deadmau5", "4+4", "32" | quoted strings in  1.3; <br>C++ string class, briefly in 2.3<br> C-strings: 8.1;<br> C++ string class in detail: 8.2 |
| single characters | `char` | 'a', '5', '+'      | intro 2.3          |
| boolean (true/false) | `bool` |  `true`, `false`  | intro 2.3, more in  2.4, converting to int, 3.1  |

You should also know about two additional data types:

* arrays, i.e. groups of values of like type.  These are discussed in Chapter 7.
* structs, groups of values of differing types.   These are discussed in Section 10.1

## Arrays

Arrays (Chapter 7) are different from Python lists in that every element on an array in C++ *must* be of *exactly* the same type.

Examples: 

```cpp

int nums[5]={10,20,30,40,50};
string names[5]={"UCLA","UCSD","UCSB","UCI","Cal Poly"}
```

## Structs

Structs allow for elements of different types.  A struct definition defines a new type; you can then declare variables or arrays of that type.      Note that a struct definition must end in a semicolon (`;`) and this
is one of the few times you need a semicolon after a closing brace (i.e. `};`).   

A struct definition d

```cpp

struct Student {
   int perm;
   string name;
};

Student p = { 1234567, "Pat"};

Student freshmen[2] = { { 1234567, "Pat"}, { 2345678, "Chris"} };

```

If CS16 instructors can provide a "fast-forward overview" of these types&mdash;perhaps long before students
get to them in Chapters 7 or 10 of the textbook&mdash;it can enable students to write much more interesting programs.

Being restricted to doing *nothing* with arrays or structs until after Chapter 7, or Chapter 10, respectively
means the coding examples are likely to be FAR less interesting that if we can fast-forward that a bit.

Less Commonly Used Types
========================

In addition, a few important, but less commonly used types are
introducted in the textbook. This is not necessarily a complete list—it
is here just as a handy reference. We will cover these if and only if
and when they are needed for some specific programming project in this
course. It is good for you to be aware of them, but unless you are told
otherwise, you don't need to memorize these.

TODO: FIX THIS TABLE...

| type of data | C++ keyword (or syntax) |  examples | textbook section  |
|-------------|-------------------------|-----------|-------------------|
|smaller and<br>&nbsp;larger integers | `short`,<br> `short int`, <br>`long`,<br> `long int`<br> `long long` | -32768, 32767, 1024L | section 2.3 |
|C++11 integer types<br>&nbsp;of specific sizes | `int8_t`, `uint8_t`,<br> `int16_t`, `uint16_t`,<br> `int32_t`, `uint32_t`,<br>`int64_t`, `uint64_t`  | (used for integers that have to have a specific number of bits, e.g. for network protocol packet headers, data file formats, low level hardware communication, etc.)  | section 2.3 (new in Savitch 9th edition) |
| smaller and<br> larger real numbers |  `float` and<br> `long double` |  3.14159F, -4.0L |  section 2.3 |
| enumerated types | `enum` |  `enum DayOfWeek = { SUN=0, MON=2, TUE=3, WED=4, THU=5, FRI=6, SAT=7 };` | section 3.1 |
| multi-dimensional arrays | `int a[2][2]` | `int a[2][2] = { {10, 20}, {30, 40} };` | section 7.1 |
| vectors | `vector<int&> v;` |  `v.push_back(42);` | section 8.3 |

Note that "programmer-defined objects", also known as
"programmer-defined classes", is a topic that is normally deferred to
CS24. So it is likely that we will NOT be covering that topic in this
course—that's why I've left it out of the table.

Four basic scalar data types: int, double, char, bool
=====================================================

I haven't seen the word <em>scalar</em> used very often in the context
of C++ programming, but it is a commonly used term when discussing
programing languages in general. It means values that hold a "single"
value, as opposed to a "group" of values.

That is `int`is a scalar data type for integer is because if you
declare:

    int x;

then `x` can only hold one integer value at a time. (This is
contradistinction to an array or struct which may hold multiple values).

The four scalar data types we will introduce right away are these:

-   int (for integers)
-   double (for real numbers with decimals)
-   char (for single 8-bit characters)
-   bool (for true or false values)

We'll introduce others only as they either (a) are needed for a specific
assignment or (b) come up in their normal place in the textbook.

Declaring variables
-------------------

In C++ it is necessary to declare variables before they are used, and
once a variable is declared to be a certain type, it may only be
assigned values of that time.

Here's an example of a short program that declares a variable of each of
our four basic types:

```cpp
    int main() {
      int w;
      double x;
      char y;
      bool z;
      return 0;
    } 
```

After variables are declared, they can be assigned:

```cpp
    int main() {

      int w;
      w = 4;

      double x;
      x = 3.4;

      char y;
      y = '+';

      bool z;
      z = true;

      return 0;
    } 
```

Or, the declaration can be combined with an initial assignment. In C and
C++, the value of an uninitiatized variable can be unpredictable, and
you won't necessarily get a warning or an error if you use an
uninitiatized variable in a later computation. So it may be a good
practice to give variables initial values unless you have a very good
reason not to.

```cpp
    int main() {

      int w = 4;
      double x = 3.4;
      char y = '+';
      bool z = true;

      return 0;
    } 
```

Scope of variables
------------------

Variables are known only in the "scope" in which they are declared.

-   For the most part, scope means the smallest set of curly
    braces (i.e. { } ) in which the variable is declared. That may be a
    function, e.g.:

```cpp
    int squared(int x) 
    {
      int resuilt = x * x;
      return result;
    }
```

-   Or, it might be a set of braces that are a "block", e.g. part of an
    if/else, for loop, while loop, or just a block used to isolate the
    scope of a variable. For example, the scope of `disc` is the
    enclosing curly braces of the if. It is not available outside that
    set of braces.


```cpp
    double root1(int a, int b, int c)
    {
       if (a != 0) 
       {
          double disc = b*b - 4*a*c;
          return ((-b) + sqrt(disc))/(2.0 * a);
       } 
      else
      {
         cerr << "Error: a is 0" << endl;
         exit(1);
      }
    }
```

-   One exception is the header of a for loop. The scope here, is the
    body of the for loop (which may or may not have braces around it.
    For example:

```cpp
    for (int i=0;i<n;i++)
       cout << i << endl;
```

-   Another exception is formal parameters declared in the header of
    a function. The scope here, is the body of the function (which will
    always have braces around it. ) —For example:


```cpp
    int squared(int x) 
    {
      return x * x;
    }
```

In this course, we will almost always declare variables in some local
scope:

-   inside `main()`
-   inside another function, or as parameters to the function
-   in the header of a for loop.

(We'll discuss the case of putting a variable declaration inside a
struct as a separate issue later on.)

Global variables: almost never a good idea at this stage
--------------------------------------------------------

Variables declared outside any function are called "global variables".

-   Their scope is "global", meaning that they can be referred to in any
    function that appears after the declaration in the C++ source file
    in which they are declared.
-   Although I don't want to get into it in detail, I will mention for
    completness that they can also be referred to inside functions in
    other files if they are declared with an "extern" declaration.

Global variables are almost NEVER a good idea.

-   Using them indiscriminately can lead to software that is very
    difficult to understand and maintain as it grows.
-   For this reason, in introductory programming courses, their use is
    typically prohibited, or at least strongly discouraged.

This prohibition is not permanent or absolute:

-   As an example, the identifiers `cin` and `cout` are both, in fact,
    global variables in any C++ program that uses `#include<iostream>`.
-   So anyone that gets too dogmatic or fundamentalist about global
    variables in C++ clearly isn't seeing the bigger picture.
-   You'll eventually be exposed to the guidelines for proper use of
    global variables—i.e. the special cases where they can be justified,
    and the safeguards you need to put in place around them to prevent
    them from poisoning your code.
-   As you gain more experience in software development, these
    guidelines will become easier to understand.
-   For now, though, please trust the decades of experience and the
    general consensus, suspend any disbelief you may have, and AVOID
    global variables unless/until you are specifically instructed that
    they are ok to use.

int, double, char, bool: Differences between C vs. C++
------------------------------------------------------

In C, as in C++, it is necessary to declare variables before they are
used, and once a variable is declared to be a certain type, it may only
be assigned values of that time. (This behaviour of C++ is one that
existed in C first, and C++ just did the same thing.)

As far as I know, there is no difference between C and C++ in terms of
how int, double, and char are handled.

-   These were all in C before C++ branched off of C, so they operate
    pretty much the same.

The only thing I'd caution you to watch out for is the bool type. bool
may be different between C and C++, depending on which C compiler you
are using.

-   The bool data type was first introduced into C++, and only later
    made its way into C.
-   Before that, C used the int data type to represented boolean values,
    with 0 representing false, and anything that was NOT zero
    representing true.
-   When a boolean expression evaluates to true, it typically evaluates
    to the integer value 1.
-   Some versions of C compiles may have the bool type, while
    others don't. It depends on the age of the compiler, and the choice
    of the compiler designers.

Basic Info about Arrays
=======================

In both C and C++, the basic arrays that are built into the language are
a bit different from similar concepts you may have run into in other
languages. Here are some differences:

-   If you already know Java:
    -   Java Array objects have a .length property that can be used to
        determine how big the array is (a length which is fixed).
    -   Java ArrayLists objects have a .size() member function that can
        be used to determine the size of the ArrayList. (a length that
        can grow)
    -   BUT In C and C++, the programmer has to keep track of the length
        of the array, and the size of an array is fixed at the time the
        array is declared.


-   If you already know Python:
    -   The length of a Python list can be computed with the len()
        function.
    -   Python lists can grow from their initial size.
    -   BUT In C and C++, the programmer has to keep track of the length
        of the array, and the size of the array is fixed at the time the
        array is declared.

Arrays of Integers
------------------

To declare an array of ints of size 5, we write:

```cpp
       int a[5];
```

This declares the array, but does NOT initialize any of the values. The
values in the array, a\[0\] through a\[4\] are <em>uninitialilzed
storage</em> and may contain arbitary values.

We can initialize all of the values in an array of five integers to zero
by writing:

```cpp
       int a[5] = {0};
```

But this does not generalize in the way you might think. For example,
the following codes does NOT initilaize all the values in an array of
ints to the value 42. Instead, a\[0\] gets the value 42, while a\[1\]
through a\[4\] get the value 0.

```cpp
       int a[5] = {1};  
```

The rules is that if we want to initialize all elements of the array, we
list them in curly braces separated by commas. For example, this code
initializes primes to be an array of the first five prime numbers, with
prime\[0\]=2, prime\[1\]=3, etc.

```cpp
       int primes[5] = {2,3,5,7,11};  
```

If our array initializer is too short to initialize all of the values,
in the case of an array of int, the extra value get the value 0. This
code, therefore, will set prime\[0\] through prime\[4\] to 2,3,5,7,11,
respectively, but prime\[5\] through prime\[9\] will all be 0.

```cpp
       int primes[10] = {2,3,5,7,11};  
```

That's why we can set an entire int array to zero, regardless of its
size, with an array initializer of `={0}`.

If an array initializer is too big, that's a syntax error, and the
program won't compile.

If we have an array initializer, we can leave off the size of the array,
and it will be determined automatically. The following code sets
prime\[0\] through prime\[7\] to the first 8 prime numbers:

```cpp
       int primes[] = {2,3,5,7,11,13,17,19};  
```

Looping through an array of integers
------------------------------------

To loop through an array of integers, we have to know the size of that
array. Unlike in Java, where we can write:

```java
// This is Java, NOT C++
for (int i=0; i<a.length; i++) {
     System.out.println(a[i]);
}
```

or in Python where we can write:

```python
   # This is Python, not C++
   for i in range(len(a)):
      print(a[i])
```

In standard C/C++ IS NO WAY to determine from the variable a what the
size of a is. (If you encounter the the sizeof() operator, you may think
you've found a way, but that actually doesn't work.) The usual practice,
therefore, is to keep track of the size of the array with another
identifier, either a `#define` or a `const` `int` as we will now
explain.

### Using a \#define to set the array size

A `#define` is a feature of C/C++ that allows you to define a symbol
that is "search and replaced" in the program before the program is
compiled. The correct terminology for what `#define` is "pre-processor
directive", because it is done in the first phase of compiling a C/C++
program.

Among the many traditional uses of `#define` in C/C++ code is to use it
to define symbols in `ALL_CAPITAL_LETTERS` that stand for the sizes of
arrays used in the program.

A \#define typically appears near the beginning of the file, and
traditionally in column 1, not indented. Unlike most lines of C/C++ code
it does NOT end in a semicolon---if you put a semicolon, the semicolon
is part of the definition of symbol (i.e. NUM\_SCORES is replaced with
`20;` everywhere it appears instead of `20` which is typically NOT what
you want.

```cpp
    #define NUM_SCORES 20
```

After a `#define` is used to set up text that `NUM_SCORES` is replaced
with `20`, we can write this to define an array called `scores` and
initialize it to hold 20 scores in values `score[0]` through
`score[19]`. Initially, all of these are set to the value 0 by the
`={0}` part:

```cpp
       int scores[NUM_SCORES] = {0};    
```

Then, later, we can use this loop to print out all of the scores, one
per line.

```cpp
       for (int i=0; i<NUM_SCORES; i++)
          cout << scores[i] << endl;
```

### Using a `const` `int` to set the array size

Another way to set the array size is with a `const` `int` declaration.
This is subtly different from using a `#define`. A full explanation of
the subtle differences and the pros/cons of one vs. the other are a
topic for another article—my purpose here is just to show you both,
because you will encounter both in looking at code examples.

For now, if you have to choose between them, choose the `const` `int`,
because as a beginner, the error messages you get if you make a mistake
are likely to be less confusing.

A `const` `int` declaration looks just like declaring a variable of type
`int` except it is preceeded with the word `const`, which is an
abbreviation for "constant". The difference between a `const` `int` and
a regular `int` variable is that a `const` `int` must be given a value
when it is created, and that value can never be changed once assigned.

Some programmers use capital letters for `const` `int` values, while
others don't. Either way, it is a matter of convention, not a
requirement of the language.

```cpp
    const int NUM_SCORES=20;
```

`NUM_SCORES` can now be used in the same way as the `#define` example
above, to both indicate the size of the array, and as the value that
keeps track of the array size.

Declaring the array:

```cpp
       int scores[NUM_SCORES] = {0};    
```

Setting the limit of the loop for the array:

```cpp
       for (int i=0; i<NUM_SCORES; i++)
          cout << scores[i] << endl;
```

### This seems really annoying compared to Java/Python; is C/C++ stupid?

This limitation of the arrays that are built into the language may seem
like a serious limitation of C/C++ as compared to languages such as
Python and Java. And to be honest, this is an annoying limitation.

However:

-   there are good reasons why C/C++ arrays are like this
-   this limitation doesn't come without certain benefits
-   In C++ there are alternatives to arrays that behave more like the
    array objects you may be used to in Python and Java

This last point may be a particular annoyance: if there are alternatives
that are more convenient for the programmer, why don't we use THOSE in
our CS16 programs?

There are several reasons.

-   Lots of C/C++ code you will encounter in the "wild" does things the
    "traditional" way.
    -   This includes, for example, the source code of things like the
        lowest levels of the Linux, MacOS, and Windows operating
        systems, embedded computers, and device drivers for hardware
        components
    -   Being able to read and understand that code is an important
        skill
    -   The higher level alternatives really only work in C++ (though it
        is possible to build something in C that works in a similar
        fashion, this is typically not done).


-   Doing this this way emphasizes the way that data is actually
    organized "under the hood"
    -   One of the reasons we teach C/C++ is that is it very "close to
        the machine"
    -   There is far less "magic" happening--it is easier to see the
        relationship between the software and the hardware
    -   This point is true not just of how arrays work in C/C++, but how
        many other things in C/C++ work.

This limitation isn't forever:

-   All we can ask is that you make a small leap of faith and suspend
    any disbelief you have until you've given this a chance.
-   Eventually, you'll be permitted to use this "higher levels of
    abstraction" in your programs
    -   These include the `array` and `vector` template classes
    -   Those can make C++ programming almost as convenient as Java
        or Python.
    -   But there's a lot you need to learn first.

