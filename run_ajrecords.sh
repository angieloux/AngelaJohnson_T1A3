# !/bin/bash

echo "Installing gems"
sleep 1
# install dependencies from Gemfile
bundle install
sleep 1
echo "Entering AJ Records"
sleep 1
# run app
ruby ajrecords.rb