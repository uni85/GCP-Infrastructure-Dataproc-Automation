# Terraform Configuration for My Network

provider "google" {
  project = "your-project-id"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region       = "us-central1"
  network      = google_compute_network.vpc_network.id
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-http" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.id
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
}

module "vm_instance" {
  source  = "terraform-google-modules/vm/google"
  version = "~> 2.0"

  name         = "my-vm"
  zone         = "us-central1-a"
  machine_type = "n1-standard-1"
  network      = google_compute_network.vpc_network.name
  subnetwork   = google_compute_subnetwork.subnet.name
  service_account = "your-service-account@your-project-id.iam.gserviceaccount.com"
  metadata = {
    ssh-keys = "username:ssh-rsa your-ssh-key"
  }
}