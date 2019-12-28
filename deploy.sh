#!/bin/bash
sudo git clone -b monolith https://github.com/express42/reddit.git
cd reddit
#sudo bundle update --bundler
sudo bundle install
sudo puma -d
if (git --version |grep 'git\sversion')
then
if (ps aux | grep 'puma\s3')
then echo "git and puma are installed"
fi
else echo "error was detected, please check logs"
fi
