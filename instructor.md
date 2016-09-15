---
title: Instructor Resources
---

<ul>
   {% for topic in site.instructors %}
     <li>
       {% if topic.indent %} class="indent" {% endif %}><a href="{{topic.url}}">{{ topic.topic }}</a>&mdash;{{topic.desc}}
     </li>
   {% endfor %}
</ul>
