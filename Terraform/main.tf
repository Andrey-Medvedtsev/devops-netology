terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  cloud_id  = "b1gm0ag8i3cs9ojrvfcr"
  folder_id = "b1ghdflcl5hdcl2dr1e7"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "netology-1" {
  name = "netology1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ciuqfa001h8s9sa7i"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/vagrant/devops-netology/Terraform/users_yc")}"
  }
}

resource "yandex_compute_instance" "netology-2" {
  name = "netology2"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ciuqfa001h8s9sa7i"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("/home/vagrant/devops-netology/Terraform/users_yc")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_netology_1" {
  value = yandex_compute_instance.netology-1.network_interface.0.ip_address
}

output "internal_ip_address_netology_2" {
  value = yandex_compute_instance.netology-2.network_interface.0.ip_address
}


output "external_ip_address_netology_1" {
  value = yandex_compute_instance.netology-1.network_interface.0.nat_ip_address
}

output "external_ip_address_netology_2" {
  value = yandex_compute_instance.netology-2.network_interface.0.nat_ip_address
}
