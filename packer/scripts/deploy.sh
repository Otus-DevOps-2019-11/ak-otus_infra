#!/bin/bash
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
#sudo bundle update --bundler
bundle install
systemctl daemon-reload
systemctl enable puma
systemctl start puma
