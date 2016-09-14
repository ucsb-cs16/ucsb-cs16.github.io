---
topic: "Java: ArrayList to array"
desc: "e.g. ArrayList&lt;Integer&gt; to int []"
---

# A Q/A from Piazza on this topic

## Question from Student: *Pain with Primitives*

I'm trying to use the `ArrayList.toArray(new int[0])` method to get an array of ints for my arithmetic methods (plus, minus, etc).
 
Specifically
Polynomial plus(Polynomial p) {
	int[] arr = this.toArray(new int[0]);
...
}
But my IDE is complaining that 
toArray (java.lang.Object[]) in ArrayList cannot be applied 
to 	(int[])
If I change it to
int[] arr = this.toArray(new Integer[0]);
the error becomes 
toArray (T[]) 			in ArrayList cannot be applied 
to 	(java.lang.Integer[])
 
I can tell that this is happening because primitives aren't the same as types, but not the solution. What's going on here, and how do I get an int[]?

lab

The toArray() method accepts an object array and returns an array of the same type. Since ints are primitives you cannot pass an int[] to toArray, and neither can it return one. This is a commonly encountered pain point in Java, and you're right to complain about it. One solution is to write your own helper method that taken an Integer[] and returns an int[]. In the method you will create a new int[], iterate over the Integer[] and convert each Integer into an int.
 
If you're using Java 8, there's also a one-liner that you can use to achieve the same:
 
int[] arr = this.stream().mapToInt(i -> i).toArray();
This solution uses a lambda function, which is part of the new functional programming features available in Java 8. We haven't discussed these features in the class yet, and the HFJ book doesn't cover them either (the book predates Java 8). 
 
See the following thread for a more detailed discussion about this issue:
 
http://stackoverflow.com/questions/718554/how-to-convert-an-arraylist-containing-integers-to-primitive-int-array
