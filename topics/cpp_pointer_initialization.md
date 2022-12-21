---
layout: default
parent: Topics
title: "C++ pointers, initialization"
description: "What is the initial value of a pointer variable?"
---

This code declares p as a pointer to an int as a local variable:

```
#include <iostream>
using namespace std;
int main() {
  int *p;
  return 0;
}
```

The variable `p` can store the address of a value of type `int`.  Initially, though, since `p` is a local variable,
it is not automatically initialized to any particular value.    

If we print the value of `p`, we might get `0`, which as we'll learn later, represents the `NULL` pointer (i.e. a pointer ot n
to nothing).  But, we should not conclude that this is therefore always the case.

For example:

```
#include <iostream>
using namespace std;
int main() {
  int *p;
  cout << "p=" << p << endl;
  return 0;
}
```

Here's the output.

```
```

We might conclude, incorrectly, that `int *p;`, automatically gets initialized to `NULL`.   But that's not the case;
it turns out that "zero" is statistically a very "likely" value to be in an arbitrary uninitialized memory location.  But
the reality is that the value of `int *p;` is actually unpredictable.  As with all local variables in C/C++, the initial
value is just "whatever bits happen to be left over at that memory location" from the last time it was used for a stack variable.

That is: "junk data".  (We don't use the word "garbage", because we reserve that word for memory allocated on the heap
that has been abandoned.   But we'll return to that another time.)

We can see that if we allocate LOTS of pointers (an array of 100 of them, for example) and then only print the 
ones that aren't null:

```
#include <iostream>
using namespace std;

int main() {
  
  int *p[100];

  for (int i=0; i<100; i++) {
    if (p[i]!=NULL) {
      cout << "i=" << i << " p[i]=" << p[i] << endl;
    }
  }
  
}
```

```
169-231-167-226:~ pconrad$ ./ptr
i=80 p[i]=0xb0c1c0c64fde0017
i=81 p[i]=0x7fff5b13e500
i=82 p[i]=0x7fff5b13e388
i=83 p[i]=0x7fff5b13e370
i=84 p[i]=0x7fff5b13e398
i=85 p[i]=0x1
i=86 p[i]=0x7fff5b13e350
i=87 p[i]=0x114936249
i=88 p[i]=0x7fff5b13e370
i=89 p[i]=0x7fff5b13e370
i=90 p[i]=0x7fff5b13e388
i=91 p[i]=0x104ac1000
i=92 p[i]=0x100000000
i=93 p[i]=0x114935520
i=94 p[i]=0x1149354c0
169-231-167-226:~ pconrad$ 
```
