testapp_IP = 35.189.211.57

testapp_port = 9292


gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup-script.sh


gcloud compute firewall-rules create default-puma-server2 --allow=tcp:9292 --description="Allow incoming traffic on TCP port 9292" --direction=INGRESS --target-tags=puma-server
