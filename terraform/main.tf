terraform {
  # Версия terraform
  required_version = "0.12.19"
}

provider "google" {
  # Версия провайдера
  version = "2.15"

  # ID проекта
  #  project = "infra-263114"
  #  region = "europe-west-1"
  project = var.project
  region  = var.region
}

resource "google_compute_instance" "app" {
  name         = "reddit-app-ter"
  machine_type = "g1-small"
  #zone = "europe-west1-b"
  zone = var.zone_name
  tags = ["reddit-app"]
  boot_disk {
    initialize_params {
      #image = "reddit-full-111"
      image = var.disk_image
    }
  }
  connection {
    type  = "ssh"
    host  = self.network_interface[0].access_config[0].nat_ip
    user  = "root"
    agent = false
    # путь до приватного ключа
    private_key = file("~/.ssh/root.pri")
  }
  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
  metadata = {
    # путь до публичного ключа
    #  ssh-keys = "root:${file("~/.ssh/root.pub")}"
    ssh-keys = "root:${file(var.public_key_path)}"
  }
  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"
  # Название сети, в которой действует правило
  network = "default"
  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }
  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]
  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["reddit-app"]
}

resource "google_compute_project_metadata_item" "ssh-keys-appuser1" {
  key   = "ssh-keys-appuser1"
  value = "root:${file(var.public_key_path)}"
}

resource "google_compute_project_metadata_item" "ssh-keys-appuser2" {
  key   = "ssh-keys-appuser2"
  value = "root:${file(var.public_key_path)}"
}

resource "google_compute_project_metadata_item" "ssh-keys-appuser3" {
  key   = "ssh-keys-appuser3"
  value = "root:${file(var.public_key_path)}"
}

resource "google_compute_project_metadata_item" "shh-keys-appuser_web" {
  key   = "appuser_web"
  value = "root:${file(var.public_key_path)}"
}

