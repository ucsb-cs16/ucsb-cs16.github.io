---
layout: default
parent: Topics
title: "Makefile"
description: "explanation of the Makefile elements"
---


# Makefile Tutorial 
> by Lawton Nichols and Jacqueline Mai
>
Given the following code:

```cpp
//shapes.h
#ifndef SHAPES_H
#define SHAPES_H
#include <string>
using namespace std;
string drawTriangle(int width);
#endif
```

```cpp
//shapes.cpp
#include "shapes.h"
string drawTriangle(int width){
    if(width % 2 == 0 || width < 3){
        return ""; // even/negative/zero widths don't work
    }
    string res = " "; 
    
    //if we got this far, width was odd
    for (int i = 0; i < (width + 1) / 2; i++) {
        int spaces = ((width + 1) / 2 - 1) - i;
        int stars = i * 2 + 1;
        
        // output spaces, if any
        for (int j = 0; j < spaces; j++) {
            res += " ";
        }
        
        // output stars
        for (int j = 0; j < stars; j++) {
            res += "*";
        }
        
        // output spaces again
        for (int j = 0; j < spaces; j++) {
            res += " ";
        }
        
        // finally add a newline
        res += "\n";
    }
    return res;
}
```

```cpp
//tdd.h
#ifndef TDD_H
#define TDD_H
#include <string>
void assertEquals(std::string expected, std::string actual, std::string message=""); // default parameter
    // if you don't supply anything for message,
    // (i.e., call assertEquals with only 2 args.),
    // then message gets set to ""
    
void assertEquals(int expected, int actual, std::string message="");
#define ASSERT_EQUALS(expected,actual) assertEquals(expected,actual,#actual)

void assertTrue(bool expression, std::string message="");
#define ASSERT_TRUE(expression) assertTrue(expression,#expression)

void startTestGroup(std::string name);
#define START_TEST_GROUP(name) startTestGroup(name)

#endif // TDD_H
```

```cpp
//tdd.cpp
#include "tdd.h"
#include <iostream>
using std::cout;
using std::endl;

void assertEquals(std::string expected, std::string actual, std::string message) {
    if (expected==actual) {
        cout << "PASSED: " << message << endl;;
    }
    else {
        cout << "   FAILED: " << message << endl 
        << "     Expected: " << expected << " Actual: " << actual << endl; 
    }
}

void assertEquals(int expected, int actual, std::string message) {
    if (expected==actual) {
        cout << "PASSED: " << message << endl;;
    } 
    else {
        cout << "   FAILED: " << message << endl 
        << "     Expected: " << expected << " Actual: " << actual << endl; 
    }
}

void assertTrue(bool expression, std::string message) {
    if (expression) {
        cout << "PASSED: " << message << endl;;
    }
    else {
        cout << "   FAILED: " << message << endl 
        << "     Expected true, but was false " << endl;
    }
}

void startTestGroup(std::string name){
    cout << "--------------" << name << "--------------" << endl;
}
```

```cpp
//testshapes.cpp
#include "tdd.h"
#include "shapes.h"

void test_drawTriangle() {
    assertEquals("", drawTriangle(4), "width=4 case");
    assertEquals("", drawTriangle(-2), "width=-2 case");
    assertEquals(" * \n***\n", drawTriangle(3), "width=3 case");

    assertEquals("  *  \n" " *** \n" *****\n", drawTriangle(5), "width=5 case");
    assertEquals("   *   \n" "  ***  \n" " ***** \n" "*******\n", drawTriangle(7), "width=7 case");
}

int main(int argc, char *argv[])
{
    // just run the tests
    test_drawTriangle();
    return 0;
}
```

# The Goal
We want to test our shape-drawing functions from test.cpp, using the tests defined in testShapes.cpp. The testing infrastructure is defined in tdd.cpp.
 
## Compilation Process
There are two main steps to convert a program written in high-level code (whatever language you are using, C++ in this case). Technically, there is a third known as preprocessing, which you will learn more about in CS32.

* **1) Compilation**
   Takes a program file that you have written in C++ and produces a machine language file. However, this file is not immediately executable! What you have produced immediately after the compilation step is an object file, recognizable by their .o file extension.
To execute only the compile step and get an object file, use `-c` in your `g++` command. An example will be given below.

* **2) Linking**
Creates a single executable from several object files. After the linking step is complete, you have a file that can be run from the command line.
Even if your entire program is written in just one file, it will still go through a link step to check for anything external that is being included and used in the programs (libraries such as iostream, for example)
To execute the link step after you have produced the necessary object files, use `-o` in your `g++` command. An example will be given below.

## Compiling Manually
We know how to compile from the command line, but the commands can quickly become long and confusing when our program is split up between several files. For example, testShapes.cpp is a program that uses functions defined within tdd.cpp to test functions from the shapes.cpp file. To create a working testShapes executable, we would need to compile object files for tdd, shapes, and testShapes and then link them together. Compiling these things together with a bunch of calls to g++ is a pain. This is what we'd need to do to compile our code every time we make a change to any of the files:
 
Compile tdd.cpp into tdd.o: 
```
g++ -Wall -Werror -c tdd.cpp
```

Compile shapes.cpp into shapes.o:
```
g++ -Wall -Werror -c shapes.cpp
```
Compile testShapes.cpp into testShapes.o: 
```
g++ -Wall -Werror -c testShapes.cpp
```
Link all the object files together into the final program (called testShapes): 
```
g++ -Wall -Werror tdd.o shapes.o testShapes.o -o testShapes
```
Wouldn't it be nice if we could automate this process?

# Makefiles
A default Makefile must be called “Makefile” or “makefile”. Makefiles contain all the steps to compile your program(s) in the form of rules.
 
Comments start with `#`, like in Python:
```
# This is a Makefile comment
```

A rule looks like this:
```
target: dependency_1 dependency_2 …
    command_to_make_target_1
    command_to_make_target_2
    …
```
>(Note: a target does not have to have any dependencies.)
After the first line, every command line of a rule has to have a tab character (IT CAN'T BE SPACES—IT MUST BE A TAB BECAUSE MAKEFILES ARE PICKY)
 
For example, the command to create shapes.o would be written like this:
```
shapes.o: shapes.cpp
    g++ -Wall -Werror -c shapes.cpp
```

Notice that we don't have to include shapes.h in our list of dependencies, although the creation of shapes.o is actually dependent on shapes.h. This is because shapes.cpp should contain the  #include “shapes.h”, so the .h is treated as though it is already a part of the .cpp file.
 
Now, if we want to compile shapes.o, we can simply type the command make shapes.o into the command line. Another nice thing about makefiles is that they will first check for differences between the current version of the code you are trying to compile and the version that you already compiled and only update the parts you made changes to. Once again, this will save time when you have a program that depends on a lot of files, since you won’t have to wait for every single file to recompile even if you made no changes to them.
 
We can continue creating our makefile and add the rest of the commands we need to create our executable testShapes:
``` 
shapes.o: shapes.cpp
    # to make shapes.o using shapes.cpp, we only need 
    # one call to the compiler
    g++ -Wall -Werror -c shapes.cpp
 
tdd.o: tdd.cpp
    g++ -Wall -Werror -c tdd.cpp
 
testShapes.o: testShapes.cpp
    g++ -Wall -Werror -c testShapes.cpp
 
# to make our final testShapes program, we need shapes.o, tdd.o, and 
# testShapes.o listed as its dependencies
testShapes: shapes.o tdd.o testShapes.o
    g++ -Wall -Werror tdd.o shapes.o testShapes.o -o testShapes
```
# But There's More
It can get repetitive to have to retype a lot of the same components of the commands over and over for each target.
 
You can define makefile variables to make your life easier:
```
FLAGS= -Wall -Werror
```
To access the value of a variable, you say `$(variablename)`.
Now, anywhere we want to use these flags in a compilation command, we can just say `$(FLAGS)` rather than `-Wall -Werror`
 
An example list of various flags (e.g., for warning options): https://linux.die.net/man/1/g++ 
 
Here's an example Makefile that will compile shapes.o using a few different variables:
```
# variables for the flags and compiler we'll be using in the commands
FLAGS = -Wall -Werror  
CPP = g++
 
# This is the rule for shapes.o:
#   You need shapes.cpp to exist in order to make shapes.o, 
#   so it must be a dependency
shapes.o: shapes.cpp
    # to make shapes.o using shapes.cpp, we only need one call
    # to the compiler
    $(CPP) $(FLAGS) -c shapes.cpp
    # this expands to: g++ -Wall -Werror -c shapes.cpp
```
# A Few Shortcuts
Inside a rule, you can use `$@` as shorthand for your target's name, and `$^` for all your dependencies. This allows you to shorten your commands even more, so you don't have to retype all the file names you listed as your target and dependencies.
 
We can shorten our shapes.o rule (shown above) to be:
```
shapes.o: shapes.cpp
    $(CPP) $(FLAGS) -c $^
    # assume that we have defined variables CPP and FLAGS already
```
# Making Everything
Now let's put everything together. The complete Makefile is below:
```
FLAGS = -Wall -Werror
CPP = g++
 
# This is the rule for shapes.o:
#   You need shapes.cpp to exist in order to make shapes.o, so it must
#   be a dependency
shapes.o: shapes.cpp
    # to make shapes.o using shapes.cpp, we only need one call
    # to the compiler
    $(CPP) $(FLAGS) -c shapes.cpp
    # this expands to: g++ -Wall -Werror -c shapes.cpp
 
tdd.o: tdd.cpp
    $(CPP) $(FLAGS) -c $^
 
testShapes.o: testShapes.cpp
    $(CPP) $(FLAGS) -c $^
 
# to make our final testShapes program, we need shapes.o, tdd.o, and 
# testShapes.o as dependencies
testShapes: shapes.o tdd.o testShapes.o
    $(CPP) $(FLAGS) $^ -o $@
    # the above line expands to:
    # g++ -Wall -Werror shapes.o tdd.o testShapes.o -o testShapes
```
>The Magic of Makefiles
Now, to make our final testShapes program, we don't have to say make tdd.o, make shapes.o, and make testShapes.o first! If make sees that a dependency has not been made yet, it looks for a rule corresponding to that dependency and makes it automatically for you! So, we can make testShapes without having explicitly called make tdd.o, make shapes.o, or make testShapes.o. Make will compile the .o files first as necessary before moving on to testShapes. And, as mentioned before, if you change a file, make sees that and only re-runs rules that require that changed file—this will become helpful if you ever work with very large repositories (where it takes a very very very long time to compile everything).
 
>Default Rules
You may have seen some makefiles that don't have any commands for compiling .o files at all. 
make has some default rules defined, so we don't actually have to give rules for .o files—notice that the steps to make tdd.o and testShapes.o were the same. You can write a command like...
```
        example: example.o
        g++ -Wall -Werror -o example.o example
```

>...without writing a command for example.o. The makefile will then look in the current directory for a .cpp and a .h file of the same name as the given .o (“example”, in this case), compile them into a .o file, then proceed with the linking command to create the executable.

# Using the Makefile We Just Made
On the terminal, we say make target to perform all the steps we defined in our Makefile for a specific target. For example, we'd say make shapes.o for our Makefile.
    
 
# More references

* <https://www.ibm.com/support/knowledgecenter/en/ssw_aix_71/com.ibm.aix.cmds3/make.htm>
* A Make Tutorial: <http://makepp.sourceforge.net/1.19/makepp_tutorial.html>
* Lecture by Richert Wang <https://ucsb-cs32.github.io/w20/lectures/lect01/>

