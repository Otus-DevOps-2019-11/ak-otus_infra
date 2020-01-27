ak-otus Infra repository



--- Task "Модели управления инфраструктурой Packer"

Параметризированы:
- ID проекта
- source_image_family
- machine_type
Создан variables.json и добавлен в .gitignor

Исследованы другие опции builder для GCP. Добавлены опции:
- Описание образа
- Размер и тип диска
- Теги

Создан variables.json.example с примером заполнения.

Создан шаблон immutable.json с image_family reddit-full. puma запускается через systemd unit.

Создан create-reddit-vm.sh скрипт для запуска виртуальной машины из образа, создаваемого после immutable.json

packer/packer build immutable.json
config_cripts/create-reddit-vm.sh


--- End task "Модели управления инфраструктурой Packer"


--- Task "Сборка образов VM при помощи Packer"

testapp_IP = 35.189.211.57

testapp_port = 9292

gcloud compute instances create reddit-app
--boot-disk-size=10GB
--image-family ubuntu-1604-lts
--image-project=ubuntu-os-cloud
--machine-type=g1-small
--tags puma-server
--restart-on-failure
--metadata-from-file startup-script=startup-script.sh

gcloud compute firewall-rules create default-puma-server2 --allow=tcp:9292 --description="Allow incoming traffic on TCP port 9292" --direction=INGRESS --target-tags=puma-server

--- End task "Сборка образов VM при помощи Packer"



--- Task "Google Cloud Platform"

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

--- End task Google Cloud Platform HomeWork


--- Task Практика IaC с использованием Terraform

terraform-1

main.tf - основной конфигурационный файл с описанием инфраструктуры;
outputs.tf - содержит "выходные" переменные;
variables.tf - содержащит входные переменные;
terraform.tfvars - файл, содержащий входные переменные, из которого Terraform загружает значения автоматически при каждом запуске;
Выполнено самостоятельное задание с объявлением переменных и создан terraform.tfvars.example;
Выполнено задание с *, добавилены ssh ключи в метаданные проекта для пользователей appuser, appuser1, appuser2;
Добавленный через web-интерфейс ключ appuser_web удаляется после применения terraform apply

--- End task Практика IaC с использованием Terraform
