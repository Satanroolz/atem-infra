terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  version = "3.5.0"
  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "atembot_server" {
  name         = "atem-bot"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_network" "atem_net" {
  name                    = "atem_network"
  auto_create_subnetworks = "true"
}