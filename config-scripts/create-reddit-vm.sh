gcloud compute instances create reddit-app \
--image reddit-full-111 \
--machine-type=g1-small \
--tags puma-server \
--zone=europe-west1-b \
--restart-on-failure
