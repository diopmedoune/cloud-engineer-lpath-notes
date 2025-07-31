terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
    project = "qwiklabs-gcp-01-4577bb68877b"
    region = "us-east4"
    zone = "us-east4-a"
}

resource "google_compute_instance" "terraform" {
    name         = "terraform" 
    machine_type = "e2-medium"
    tags         = ["web", "dev"]
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    allow_stopping_for_update = true
}
