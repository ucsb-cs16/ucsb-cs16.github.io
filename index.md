---
title: UCSB CS16
---

# [Problem Solving with Computers I](https://www.cs.ucsb.edu/education/courses/cmpsc-16)

<div id="about" data-role="collapsible" data-collapsed="false" markdown="1">
<h2>About this course</h2>

A course taught in the [Dept. of Computer Science](http://www.cs.ucsb.edu) at
[UC Santa Barbara](http://www.ucsb.edu).

Some older materials can be found at the [16wiki](https://foo.cs.ucsb.edu/16wiki) site.

This site is maintained in this github repo: <https://github.com/ucsb-cs16/ucsb-cs16.github.io>.   If you are a CS department faculty member or TA that should have access to this page, contact Phill Conrad to request permission.

</div><!-- about -->


<div id="textbooks" data-role="collapsible" data-collapsed="false">
  <h2>Textbooks</h2>
    <ul>
      {% assign textbooks = site.textbooks | sort: 'custom_sort_order' %}
      {% for textbook in textbooks %}
         <li><a href="{{textbook.url}}">{{ textbook.title }}</a>&mdash;{{textbook.desc}}</li>
      {% endfor %}
    </ul>
</div>

<div id="topics" data-role="collapsible" data-collapsed="false">
  <h2>Topics</h2>
  <ul>
   {% for topic in site.topics %}
     <li><a href="{{topic.url}}">{{ topic.topic }}</a>&mdash;{{topic.desc}}</li>
   {% endfor %}
  </ul>
</div>


<div id="resources" data-role="collapsible" data-collapsed="false">
  <h2>Resources</h2>
  <ul>
   {% for topic in site.resources %}
     <li><a href="{{topic.url}}">{{ topic.topic }}</a>&mdash;{{topic.desc}}</li>
   {% endfor %}
  </ul>
</div>

