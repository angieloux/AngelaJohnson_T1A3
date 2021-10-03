# !/bin/bash

echo "Installing gems"
sleep 1
# install dependencies from Gemfile
gem install bundler 
bundle install
sleep 1
echo "Entering AJ Records"
sleep 1
# run app
ruby ajrecords.rb