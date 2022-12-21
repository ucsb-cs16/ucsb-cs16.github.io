---
layout: default
parent: Topics
title: "C++"
description: "The C++ programming language"
---

C++ was introduced by Bjarne Straustroup, an employee of Bell Labs, in 1979, first under the name "C with classes".    It was later renamed
C++.    The first edition of the first book about C++, 
[The C++ Programming Language](https://en.wikipedia.org/wiki/The_C%2B%2B_Programming_Language) was published in 1985, which is also
also the year that the first commerical implementation was made available.

Even though C++ is over 30 years old, it is still widely used, especially in systems that need raw compute speed.


<div data-role="collapsible" data-collapsed="false">
  <h2>More on C++</h2>
  <ul>
   {% for topic in site.topics %}
       {% if topic.topic contains "C++: " %} 
           <li><a href="{{topic.url}}">{{ topic.topic }}</a>&mdash;{{topic.desc}}</li>
       {% endif %}
   {% endfor %}
  </ul>
</div>
