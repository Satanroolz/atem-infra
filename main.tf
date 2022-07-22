provider "google" {
  project = "{{YOUR GCP PROJECT}}"
  region  = "us-central1"
  zone    = "us-central1-a"
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