---
layout: default
parent: Topics
title: "C++ functions"
description: "C++ function prototypes"
---

# In C and C++, order matters when you're defining functions

In general, you can only call a function that has already been defined.<br />

The example below does not work because of the order of the functions. Can you fix it?


```cpp
#include <iostream>

int multiply_by_4(int x)
{
  int result;

  result = multiply_by_2(x);
  result = multiply_by_2(result);

  return result;
}

int multiply_by_2(int x)
{
  return x * 2;
}

int main()
{
  int value;

  value = multiply_by_4(10);

  std::cout << "10 * 4 = " << value << std::endl;

  return 0;
}
```

Since `multiply_by_4()` uses `multiply_by_2()`, `multiply_by_2()` must appear in the code before `multiply_by_4()`. If that was the end of the story, some programs would be hard or impossible to write and get all of the functions in the right order. Luckily we have some options in C and C++ to make it easier.

## Function Prototypes 
Function prototypes are the way we declare the functions we intend to use in a program. To create a prototype, we write the return type, the name of the function and its argument list (like we would for a function definition) somewhere at the top of the file and that's it. We can write the function anywhere else in the program, and since its prototype is at the top we don't have to worry about the order of the functions.<br />

The example below shows how to fix the first program without re-arranging the function order.<br /> 

```cpp
#include <iostream>

int multiply_by_4(int x);
int multiply_by_2(int x);

int multiply_by_4(int x)
{
  int result;

  result = multiply_by_2(x);
  result = multiply_by_2(result);

  return result;
}

int multiply_by_2(int x)
{
  return x * 2;
}

int main()
{
  int value;

  value = multiply_by_4(10);

  std::cout << "10 * 4 = " << value << std::endl;

  return 0;
}
```

By using function prototypes at the top of the file, every function following them knows about all of the functions that have been prototyped and we won't have any order issues.

## Header Files 

It's a bit ugly to have all these prototypes at the top of a program. Large programs might have a full page of prototypes! So C and C++ give us another tool to take them out of our `*.c` and `*.cpp` files entirely called the <b>header file</b>. We move all of the function prototypes to a header file with the extension ".h" and then #include the header file at the top of our `*.cpp` files.<br />

The following example illustrates how to use a header file to solve the first problem without cluttering the top of the file with prototypes.

```cpp
#include "functions3.h"

int multiply_by_4(int x)
{
  int result;

  result = multiply_by_2(x);
  result = multiply_by_2(result);

  return result;
}

int multiply_by_2(int x)
{
  return x * 2;
}

int main()
{
  int value;

  value = multiply_by_4(10);

  std::cout << "10 * 4 = " << value << std::endl;

  return 0;
}
```

```cpp
int multiply_by_4(int x);
int multiply_by_2(int x);
```

Notice that we now have <i>two</i> files in our program: `functions3.cpp` and `functions3.h`. Also notice that we give the name of the `*.h` file we are `#include`-ing inside double-quotes instead of angled braces. T

This tells the compiler to look for this header file in the same place that the `*.cpp` file is located instead of in the place where the system usually stores `*.h` files.



