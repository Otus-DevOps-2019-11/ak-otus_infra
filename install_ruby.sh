#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
if (sudo ruby -v |grep 'ruby\s2')
then
if (sudo bundler -v |grep 'Bundler\sversion')
then echo "ruby and bundler are installed"
fi
else  echo "error was detected, please check logs"
fi
