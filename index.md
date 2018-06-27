---
title: UCSB CS16
---

# Problem Solving with Computers I

<div id="about" data-role="collapsible" data-collapsed="true" markdown="1">
<h2>About this course</h2>

A course taught in the [Dept. of Computer Science](http://www.cs.ucsb.edu) at
[UC Santa Barbara](http://www.ucsb.edu).

This site is maintained in this github repo: <https://github.com/ucsb-cs16/ucsb-cs16.github.io>.   If you are a CS department faculty member or TA that should have access to this page, contact Phill Conrad to request permission.

* [Catalog Description](https://www.cs.ucsb.edu/education/courses/cmpsc-16) including pre-requisites
* A more detailed look at [course prerequisites](/info/prereqs/) including a
   list of specific skills and knowledge you need before starting the course.
* [Older materials from Conrad's 16wiki](https://foo.cs.ucsb.edu/16wiki) site.
* [Older materials from Conrad's personal website](https://www.cs.ucsb.edu/~pconrad/cs16)

# Previous Offerings of CS16

* [S18 Mirza](https://ucsb-cs16-s18.github.io)
* [W18 Mirza](https://ucsb-cs16-w18.github.io)
* [S17 Matni](https://ucsb-cs16-s17.github.io)
* [S17 Mirza](https://ucsb-cs16-sp17.github.io)
* [W17 Mirza](https://ucsb-cs16-wi17.github.io)
* [F17 Matni](https://ucsb-cs16-f17.github.io)

</div><!-- about -->


<div id="textbooks" data-role="collapsible" data-collapsed="false">
  <h2>Textbooks</h2>
    <ul>
      {% assign textbooks = site.textbooks | sort: 'custom_sort_order' %}
      {% for textbook in textbooks %}
         <li {% if topic.indent %} class="indent" {% endif %}><a href="{{textbook.url}}">{{ textbook.title }}</a>&mdash;{{textbook.desc}}</li>
      {% endfor %}
    </ul>
</div>

<div id="topics" data-role="collapsible" data-collapsed="false">
  <h2>Topics</h2>
  <ul>
   {% for topic in site.topics %}
     <li {% if topic.indent %} class="indent" {% endif %}><a href="{{topic.url}}">{{ topic.topic }}</a>&mdash;{{topic.desc}}</li>
   {% endfor %}
  </ul>
</div>


<div id="resources" data-role="collapsible" data-collapsed="false">
  <h2>Resources</h2>
  <ul>
   {% for topic in site.resources %}
     <li {% if topic.indent %} class="indent" {% endif %}><a href="{{topic.url}}">{{ topic.topic }}</a>&mdash;{{topic.desc}}</li>
   {% endfor %}
  </ul>
</div>

