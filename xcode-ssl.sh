#!/bin/bash

# install Xcode Command Line Tools
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" ;

#Wait 10 seconds
sleep 10s

#Install SLL Modules
sudo cpan Mozilla::CA


#Wait 10 seconds
sleep 10s

#Install CA Module again so it goes to the right directory
sudo cpan Mozilla::CA
