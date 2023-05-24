terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
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
      image = var.image
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
  name                    = "atem-network"
  auto_create_subnetworks = "true"
}