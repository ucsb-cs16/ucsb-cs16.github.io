#!/usr/bin/env bash


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm use 2.5.1 --install
gem install bundler 
gem install pkg-config
gem install nokogiri
bundle install --path vendor/bundle
bundle exec jekyll serve $@
