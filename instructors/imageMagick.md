---
parent: "Instructor Resources"
layout: default
title: "ImageMagick"
description: "command line tool for manipulating images"
---

ImageMagick is a command line utililty, or more precisely, a collection of command line utilities for Unix that
do various image manipulations.

It is available on the CSIL systems at UCSB.  It can also be installed on Mac OS through the [Homebrew Package Manager](http://brew.sh) via
`brew install imagemagick`.

Then, you can use the `convert` command line tool to do many useful things.

Here is a set of aliases, for example, that you can setup so that you can create various sizes of images for a collection
of .png files.  For example, typing `mk50` will result in all .png files in the current directory being copied to a half-sized version
version of the same file with `-50.png` as the extension.

```
alias mk30='for i in *[a-z].png; do convert -resize 30\% $i ${i/.png/-30.png}; done'
alias mk40='for i in *[a-z].png; do convert -resize 40\% $i ${i/.png/-40.png}; done'
alias mk50='for i in *[a-z].png; do convert -resize 50\% $i ${i/.png/-50.png}; done'
alias mk60='for i in *[a-z].png; do convert -resize 60\% $i ${i/.png/-60.png}; done'
alias mk70='for i in *[a-z].png; do convert -resize 70\% $i ${i/.png/-70.png}; done'
```
