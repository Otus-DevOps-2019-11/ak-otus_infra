# ak-otus_infra
ak-otus Infra repository

Google Cloud Platform HomeWork

bastion_IP = 104.197.247.8
someinternalhost_IP = 10.142.0.2

connect to someinternalhost by one command line:
ssh -i ~/.ssh/root -t -L 1521:104.197.247.8:51521 root@104.197.247.8 ssh -L 51521:10.142.0.2:1521 root@10.142.0.2

aliases:
cat  ~/.ssh/config
Host *
ForwardAgent yes

Host bastion
HostName 104.197.247.8
User root

Host someinternalhost
HostName 10.142.0.2
User root
ProxyCommand ssh bastion nc %h %p
