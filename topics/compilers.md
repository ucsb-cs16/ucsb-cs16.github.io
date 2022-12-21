---
layout: default
parent: Topics
title: "Compilers"
description: "programs that translate C++ to machine code (g++, clang)"
---

In programming, the term <em>compiler</em> refers to a program that:

* takes as its input a program written in <em>source code</em> as input (e.g. a program in C++, Python, Java)
* produces as output that program in "object code" as output.   

For C++, the two main compilers we use are `g++` and `clang++`.  Both are free and open source:

* `g++` is the default compiler used by the `make` program on CSIL, and the most commonly used compiler.  It comes from the [gcc family of compilers](https://gcc.gnu.org/), supported by [GNU](https://www.gnu.org/), a project of the [Free Software Foundation](http://www.fsf.org/).  It is open source under the GNU public license.
* `clang++` is an alternative compiler available on the CSIL machines.   [clang++](http://clang.llvm.org/) is a part of the [LLVM family of compilers](http://llvm.org/), which began as a research project at the Univ. of Illinois, and is open source under the BSD Open Source license.

# Why would I want to use `clang++` instead of `g++` (or vice-versa)?

Both compilers are good choices&mdash;there is no particular reason for us to recommend one over the other.

However, there are some circumstances where you might want to *switch* compilers: 

* Error messages: if you have a syntax error and the error message from the compiler is difficult to understand, try switching to
    the other compiler.   For each of the two compilers, there are special cases where the error message from one is easier to understand than
    the other.
* Debugging: Sometimes a C++ program will have a bug because of code that has *undefined behavior*.  In this case, running with both
    compilers can help you determine the source of the problem.
    * In this case *undefined behavior* is a technical term meaning that the program code is 
        written in a way that is behavior cannot be accurately predicted.   
    * Examples include printing the value of an uninitalized variable, 
         or indexing into an array with an uninitialized variable.  
    * Since an uninitialized variable can contain many different values (e.g. 
         for a 32-bit&nbsp;integer, over 4&nbsp;billion values), there could be
         many different possible outcomes.
    * It is often the case that for such code, running the same program compiled with `g++` and `clang++` produces different results.
    * Trying your code with both compilers before turning it in, or if/when your code is misbehaving, is often a helpful way to 
        uncover what might be going wrong.
        
# How do I switch between using `g++` and `clang++`?

On CSIL, by default, the compiler used by `make` is `g++`.  However, you can change the default compiler to clang++ by defining the environment
variable CXX, as shown in this transcript:

```
-bash-4.3$ hostname
csil.cs.ucsb.edu
-bash-4.3$ cat hello.cpp
#include <iostream>
using namespace std;

int main(void) {
  cout << "Hello, World!" << endl;
}
-bash-4.3$ make hello
g++     hello.cpp   -o hello
-bash-4.3$ ./hello
Hello, World!
-bash-4.3$ rm hello
-bash-4.3$ export CXX=clang++
-bash-4.3$ make hello
clang++     hello.cpp   -o hello
-bash-4.3$ ./hello
Hello, World!
-bash-4.3$ export CXX=g++
-bash-4.3$ rm hello
-bash-4.3$ make hello
g++     hello.cpp   -o hello
-bash-4.3$ 
```

