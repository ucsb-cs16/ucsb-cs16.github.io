---
topic: Jekyll
desc: "Creating web sites (like this one) on github-pages using Markdown"
layout: default
---



# Jekyll

Jekyll is a software package that can be used in conjunction with github.com to publish web pages easily.   

The web site you are looking at now is created via Jekyll.

More information about Jekyll is available at this page: <https://pconrad-webapps.github.io/topics/jekyll>

* Content is authored in markdown, and kept in github.com repositories.
* Content is published automatically to a site with the url ____.github.io every time you push changes to your repo.
* There is no database to configure, and authorization is handled by existing github.com authorization mechanisms.
* There is no "lock-in"; it is straightforward to migrate a Jekyll-based site to a platforms outside of github.com (for example, Heroku, or any host that supports Ruby.)


# Creating pages

* Create pages as index.md files in a directory with the name that you want the page to appear under.
    - For example, to make a page with the URL `site.github.io/topics/jekyll`, create the file `/topics/jeykll/index.md`
* `.md` files must start with what Jekyll calls [*Front Matter*](https://jekyllrb.com/docs/frontmatter/).  
    - The minimal front matter is two consecutive lines of exactly three hyphens `---`
    - Use this minimal front matter until you have a reason to do something more specific
    - The front matter can be used to configure things such as the title of the page, and many other things.
    - The format of the front matter is Yaml (a syntax for key/value associations that includes JSON as a subset).

Example of minimal front matter:

~~~
---
---
~~~

If you want your pages to have an html `<title>` element, you need to specify at least one default layout (explained below), and the specify this
layout along with the title:

~~~
---
layout: default
title: Jekyll
---
~~~

# Nested lists

* The default Markdown processor is [Kramdown](http://kramdown.gettalong.org/), which has [a few restrictions beyond standard Github-Flavored Markdown](http://kramdown.gettalong.org/syntax.html).
* The one you may encounter first is that in standard Github-Flavored Markdown, nested lists may be indicated with any amount of indentation:

~~~
* First level item 1
 - Second level item a
 - Seond level item b
* First level item 2
~~~

In Kramdown, you must indent four spaces to get a second level of list:

~~~
* First level item 1
    - Second level item a
    - Second level item b
* First level item 2
~~~

# Configuration

* The file `_config.yml` in the root of the repository can be used to configure various Jekyll properties
    - As an example, `markdown: rdiscount` specifies a different Markdown processor to use instead of the default.

# Layouts

In Jekyll a  *layout* specifies the common features of a category of pages on your site.   For example, for a course web site, you might have different layouts for:

* general course information pages
* lab assignments
* homework assignments
* summaries of lecture notes

Strictly speaking, layouts are optional.   It is possible to create a minimally functional site without providing layouts.  However, it is recommended to provide at least one default layout.   If you don't, while the pages produced will work in most browsers, pages will not be compliant HTML.   For example it is the layout that provides the template for putting in the `<head></head>` section that contains the page `<title></title>` element.   Thus, without a layout, specifying a `title: my title` in the [front matter](https://jekyllrb.com/docs/frontmatter/) will have no effect.

Layouts are created in the `_layouts` subdirectory of the root of the site repository.

The jekyll documentation provides a good [tutorial on creating a `default.html` layout](http://jekyll.tips/guide/layouts/).  This is a good place to start, though your `default.html` layout can likely be much simpler than the one shown on that site.  Here is a much simpler example.     Here is some insight into what it contains:

* The `<!DOCTYPE html>` is the latest HTML 5 compliant document type
* In the `head` element:
    * The `meta` elements provide for UTF-8 encoding, and proper scaling on small devices (e.g. mobile phone browsers).  
    * The `title` element now references `{{page.title}}` which brings in the title from the [front matter](https://jekyllrb.com/docs/frontmatter/) of your `.md` file.
* In the `body` element, the `{{ content }}` inserts the contents of your `.md` file. 
* To actually use this, you must insert `layout: default` into the [front matter](https://jekyllrb.com/docs/frontmatter/) of your `.md` files.   If you don't want to have to do this on every single .md file (and why would you?) you can specify this as a default in your `_config.yml` file (see below.)

~~~
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ page.title }}</title>
  </head>
  <body id="page-top">
    {{ content }}
  </body>
</html>
~~~

# Specify default layout in `_config.yml`

Put this in your `_config.yml` to specify that `default` is the default layout for all `.md` files that don't specify a different layout.  That way, you can just use a minmal front matter that contains only the page title.

~~~
defaults:
  -
    scope:
      path: "" # an empty string here means all files in the project
    values:
      layout: "default"
~~~

# Includes

You can factor out what are sometimes called "partials" in other web frameworks, i.e. something like a `#include` in C/C++.   To do that, you create a directory in the root of the repo called `_includes`.   

The Jekyll documentation contains a [tutorial example](http://jekyll.tips/guide/navigation-and-includes/) of doing this, but again it is a bit complex.  So, here is a simpler example of creating some common navigation for a site.    This provides a link to the root of the site, and a link to the github repo where the site is hosted.

Under `_includes`, create the file `nav.html`.  This example uses absolute links, but it would be possible to use relative links also.

~~~
<nav id="mainNav">
<table border="1" style="width:auto;">
 <tr>
  <td><a href="https://UCSB-CS56-pconrad.github.io">home</a></td>
  <td><a href="https://github.com/UCSB-CS56-pconrad/UCSB-CS56-pconrad.github.io/">github repo</a></td>
 </tr>
</table>
</nav>
~~~

Then, edit the `_layouts/default.html` as shown to include this file:

~~~
<body id="page-top">
  {% include nav.html %}
  {{content}}
~~~

# Dates

Dates in Jekyll are formatted using the "Liquid filter".

More information is here: <https://help.shopify.com/themes/liquid/filters/additional-filters#date>

An example is: 

~~~
12-hour time (%I:%M:%S %p)

{{ article.published_at | date: "%r" }}
<!-- 03:20:07 PM -->
~~~

# Syntax of Templates

The template used by Jekyll is called Liquid.

The following page summarizes the syntax of things such as if statements, for loops, variable assignment, etc:

<https://github.com/Shopify/liquid/wiki/Liquid-for-Designers>
