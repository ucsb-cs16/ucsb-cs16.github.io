---
layout: default
parent: Topics
title: "Test Driven Development (TDD)"
description: "General information about best practices"
---

Test-Driven Development, TDD, refers to a development practice where you follow a cycle of four stages.  (It is usually presented as the last three, i.e. red-green-refactor, but this leaves out perhaps the most important step.)

* <span class="tdd_refactor">Design</span>. Think of some new functionality you want to add, or a bug you want to eliminate
* <span class="tdd_red">Red</span> (failing test).  Write a failing test that exposes the fact that the function doesn't work yet (or that the bug is present).
* <span class="tdd_green">Green</span> (passing test) Write code that makes the test pass.  
* <span class="tdd_refactor">Refactor the code.

There is much more that can be said about TDD than what is contained in this brief summary.  Consider this page just a starting point for your learning, not a complete list of everything you need to know.

# Kinds of testing

There are a wide variety of kinds of tests, including unit tests, functional tests, integration tests, end-to-end tests, regression tests, and others.   We'll focus mainly on unit tests in this course, though we will discuss some of the other kinds of testing.

Unit testing tries to focus on a single unit of code, e.g. a single constructor or method, ideally isolating the testing of that unit from all other dependencies.    

