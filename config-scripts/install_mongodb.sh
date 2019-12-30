#!/bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
wget -qO - https://www.mongodb.org/static/pgp/server-3.6.asc | sudo apt-key add -
sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D68FA50FEA312927
sudo apt update
sudo apt install -y mongodb-org
sleep 5
sudo systemctl start mongod
sudo systemctl enable mongod
if (sudo systemctl status mongod |grep 'running')
then echo "mongodb is installed"
else echo "error was detected, please check logs"
fi
