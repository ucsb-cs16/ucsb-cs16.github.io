---
parent: "Instructor Resources"
layout: default
title: "jekyll"
description: "The software used to produce this very website"
---

The website you are now looking at is hosting on Github Pages.   Github Pages uses software called *Jekyll* to turn
files written in Markdown, a simplified syntax for HTML, into static HTML.

In order to understand how to maintain this site, it helps to have a bit of knowledge of each of the following:

* The syntax of *Markdown*
* The *Jekyll* static site generating software 
* The *Liquid* templating language

You may also want to become familiar with [`just-the-docs`](https://just-the-docs.github.io/just-the-docs/), which is a *Jekyll theme*. 

A bit of knowledge of plain old HTML, CSS, and JavaScript can be useful as well.

The purpose of this page is NOT to be a complete reference to all of those things, but rather to accomplish two goals:

1. Refer the reader to places where they can learn more about the technologies listed above
2. Provide quick-and-dirty fixes to common issues that arise in practice with the course web pages for UCSB/UCSD courses
    hosted on this technology.
    
# A more complete reference

* The newer course repos are using [`just-the-docs`](https://just-the-docs.github.io/just-the-docs/), which is a *Jekyll theme*. 
* Older course repos may be using a theme documented (poorly) here: <https://ucsb-cs-course-repos.github.io>
    
# Quick Fixes

## I want a link 


What you type:

```
[UCSB CS Dept](https://www.cs.ucsb.edu)
```

What you get:

[UCSB CS Dept](https://www.cs.ucsb.edu)

## I want a link that opens in a new window

```
[UCSB CS Dept](https://www.cs.ucsb.edu){: target="_blank"}
```

What you get:

[UCSB CS Dept](https://www.cs.ucsb.edu){: target="_blank"}

# Running Jekyll Locally

## Mac OS

Get the software known as rvm for your mac.   Installing that is a bit of small chore, because you first must...

1. Install gpg with `brew install gpg`
2. Install curl with `brew install curl`
3. Install rvm with `\curl -sSL https://get.rvm.io | bash -s stable --ruby`

