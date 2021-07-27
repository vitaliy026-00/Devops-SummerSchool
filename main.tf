terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("gcp_key.json")

  project = "rich-elixir-321016"
  region  = "europe-north1"
  zone    = "europe-north1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "apache2"
  machine_type = "e2-small"

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210720"
    }
  }

  metadata_startup_script = "sudo apt update; sudo apt install apache2 -y"
  metadata = {
    ssh-keys = "vitalii:${file("google_key.pub")}"
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
resource "google_compute_firewall" "web" {
  name          = "test-firewall"
  network       = "default"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }
}

