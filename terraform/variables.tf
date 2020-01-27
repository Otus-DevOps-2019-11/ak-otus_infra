variable project {
  description = "Project ID"
  #  description = "infra-263114"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
  #  description = "~/.ssh/root.pub"
}
variable disk_image {
  #  description = "reddit-full-111"
  description = "Disk image"
}
variable privat_key_path {
  # Описание переменной
  description = "Path to the privat key used for ssh access"
  #  description = "~/.ssh/root.pub"
  #  default = ("~/.ssh/root")
}
variable zone_name {
  description = "Name of zone"
  default     = "europe-west1-b"
}
