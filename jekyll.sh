#!/usr/bin/env bash


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm use
rm -rf _site
bundle exec jekyll serve $@
