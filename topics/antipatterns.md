---
layout: default
parent: Topics
title: "Antipatterns"
description: "Things to avoid in your code"
---


Definition
==========

An anti-pattern is something that:

* people frequently write in their code (that's the <em>pattern</em> part)
* but that is BAD and should NOT BE DONE (that's the <em>anti</em> part).

(The term <em>anti-pattern</em> does have a more formal definition in Computer Science and some history; for purposes of CS16, we'll focus on the informal definition above.)

This page lists several common anti-patterns often seen in code written by novice programmers (e.g. code submitted by CS16 students in programming assignments, or answers to exam questions.)  In fact, the first version of this page was compiled exclusively from actual answers submitted by students to CS16 exam and homework questions.

In each of the examples below, sometimes the code might even "work" in the sense that it "computes the
correct result", but it is hard to read for other programmers, or
difficult to maintain, or might lead to later bugs or errors. Other
times it is just wasteful, in that it takes up space in the code for no
good reason.

And sometimes, it is just code that might "seem right", but is just
plain wrong.

Example
=======

One example that occurs frequently is the explicit use of `return`
`true;` and `return` `false;` after evaluating a boolean expression.

```cpp
      if (isValidTime(t)) {
        return true;
      } else {
        return false; 
      }
```

The entire if statement here is completely unnecessary. It is far more
clear to simply write:

```cpp
      return isValidTime(t);
```

Other common CS16 C++ Antipatterns
==================================

Checking `a` `<=` `b` `<=` `c` instead of `a<=b` `&&` `b<=c`
------------------------------------------------------------

To see whether b lies in between a and c (inclusive) in Math class, you
can write:

```cpp
    a <= b >= c
```

but in C++ this doesn't mean what you think it means.

It is legal syntax, but the result is not to calculate whether b lines
in the interval \[a,c\]. In C++, the first `a` `<=` `b` evaluates to
either 0 or 1, and that 0 or 1 is then compared to c. This is probably
not what you wanted.

What you wanted was this: `a<=b` `&&` `b<=c`

`count=count++;` which does NOT increment count
-----------------------------------------------

See the comments on the code below.

```cpp
      int count = 1;
      count++;  // now count is 2
      count+=1; // now count is 3
      count = count + 1; // now count is 4
      count = count++;  // OOOPS!   count is STILL 4
```

Here's why `count=count++;` does not increment count.

This line of code works, like all assignment statements, works by
evaluating the right hand side, then the left hand side.

`count++` "evaluates to the current value of count" (e.g. 4), then
increments count (e.g. to 5) as a side effect (in the background, so to
speak.)

THEN, it copies the value of the right hand side (which evaluated to 4)
to the left hand side. This changes count from 5 back to the PREVIOUS
value, i.e. 4.

So, count gets incremented briefly, then restored.

If you wrote, this it WOULD increment count:

```cpp
      count = ++count;
```

BUT DON'T DO THAT. It's silly. Be clear and just write: `count++;`
That's all you need.

The useless else branch
-----------------------

Consider this code:

```cpp
          if (a[i] == k) {
             count++;
          } else {
             count += 0;
          }
```

The else clause is useless! Adding 0 to a variable does nothing! Don't
do it! Just write this, with no else clause. An else clause is NOT
required on an if:

```cpp
          if (a[i] == k) {
             count++;
          }
```

Another variation of this antipattern is the `x=x;` assignment, like
this:

```cpp
          if (a[i]  % 2 != 0) {
             sumEvens = sumEvens + a[i];
          } else {
             sumEvens = sumEvens;
          }
```

Leave off this useless else clause! The variable sumEvens will retain
its value without you copying it back onto itself everytime through the
code.

Not factoring out common code
-----------------------------

This is an actual example of code from a CS16 student's final exam. Look
at the line `return` `count;` at the end of both the if and else blocks:

```cpp
    int countOccurences(LinkedList *list, int k) {
      int count=0;
      if (list != NULL) {
        // Lots of code to calculate count went here
        // Omitted to keep this anti-pattern example short and concise.
        return count;
      } else {
        return count;
      }
    }
```

If you have the same line at the end of both the if and else branches,
just factor it out and put it after the if/else, like this:

```cpp
    int countOccurences(LinkedList *list, int k) {
      int count=0;
      if (list != NULL) {
        // Lots of code to calculate count went here
        // Omitted to keep this anti-pattern example short and concise.
      } else {
        // now the else is empty... 
      }
      return count;
    }
```

Then, the else is empty, so it can be eliminated:

```cpp
    int countOccurences(LinkedList *list, int k) {
      int count=0;
      if (list != NULL) {
        // Lots of code to calculate count went here
        // Omitted to keep this anti-pattern example short and concise.
      }
      return count;
    }
```

An extended example
===================

Here is an example of how anti-patterns can be combined into a
monstrosity of code. This example has three anti-patterns present.

*   \(a) checking the result of a boolean function against true or false
*   \(b) checking both the true and false parts of a boolean (instead of
    assuming that if isn't true, it MUST be false) sometimes with a third
    choice that can never be reached.
*   \(c) explictly returning true or false instead of just returning the
    result of a boolean function.

Here is an atrocious example of code that has ALL THREE anti-patterns
present:

```cpp
      if (isValidTime(t)==true) {
        return true;
      } else if (isValidTime(t)==false) {
        return false; 
      } else {
        return false;
      }
```

Beleive it or not, this is the kind of code that CS16 students sometimes
write. YOU NEED TO STAMP OUT THESE BAD HABITS before you get to later
courses, and/or real world programming (such as a coding interview.)

Removing the first anti-pattern, we can replace the check against ==true
and ==false with just an invocation of the boolean function:

```cpp
      if (isValidTime(t)) {
        return true;
      } else if (!isValidTime(t)) {
        return false; 
      } else {
        return false;
      }
```

Second, we can realize that if the function call doesn't return true, it
must return false. So the second if test is unnecessary, and the else
given here can never be reached.

```cpp
      if (isValidTime(t)) {
        return true;
      } else {
        return false; 
      }
```

Finally, we can realize that there is NO POINT in explicitly returning
true and false, since that is already computed by the function. Just
return the value it computes:

```cpp
      return isValidTime(t);
```

We've gone from seven lines of convoluted, complicated code, to one line
of clear code.

Anti-Patterns specific to linked lists
======================================

For purposes of these illustrations assume:

```cpp
    struct Node {
       int data; 
       Node *next; 
    };
```

Also, assume that the list is available through a pointer called `Node`
`*head;` which is NULL if the list is empty, otherwise it points to the
first node in the list.

Moving to "next" before checking the pointer" in a loop
-------------------------------------------------------

This code to add up the elements of a linked list is incorrect. Can you
see why? What will happen—that is, what should you test, and what is the
symptom that shows this code is wrong?

```cpp
    int sum(Node *head) {
      int sum=0;
      Node *p=head;
      
      sum += p->data;
      while (p->next != NULL) {
           p = p-> next;
           sum = p->data;
      }
      return sum;
    }
```

This one line change (changing the while loop condition) does NOT fix
things. What will happen now—that is, what should you test, and what is
the symptom that shows this code is wrong?

```cpp
    int sum(Node *head) {
      int sum=0;
      Node *p=head;
      
      sum += p->data;
      while (p != NULL) {
           p = p-> next;
           sum = p->data;
      }
      return sum;
    }
```

The correct code is this:

```cpp
    int sum(Node *head) {
      int sum=0;
      Node *p=head;
      while (p != NULL) {
           sum = p->data;
           p = p-> next;
      }
      return sum;
    }
```

Which can be expresssed more succinetly with a for loop. Using a for
loop is less error prone, since everything is more likely to end up
where it should:

```cpp
    int sum(Node *head) {
      int sum=0;
      for (Node *p=head; p != NULL;  p = p-> next; ) {
           sum = p->data;
      }
      return sum;
    }
```

Formal Definition of Anti-Pattern
=================================

A more formal definition, from
[Wikipedia](http://en.wikipedia.org/wiki/Anti-pattern):

> An anti-pattern (or antipattern) is a common response to a recurring
> problem that is usually ineffective and risks being highly
> counterproductive.\[1\]\[2\]
>
> The term, coined in 1995 by Andrew Koenig,\[3\] was inspired by a
> book, Design Patterns, in which the authors highlighted a number of
> design patterns in software development that they considered to be
> highly reliable and effective. The term was popularized three years
> later by the book AntiPatterns, which extended its use beyond the
> field of software design and into general social interaction and may
> be used informally to refer to any commonly reinvented but bad
> solution to a problem. Examples include analysis paralysis, cargo cult
> programming, death march, groupthink and vendor lock-in.
