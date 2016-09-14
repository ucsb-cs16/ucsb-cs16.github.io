#!/usr/bin/env bash

echo "Installing software needed to run Jekyll locally... "
rvm install ruby-2.1.7
gem install bundler
bundle install --path vendor/bundle
echo "Done."
