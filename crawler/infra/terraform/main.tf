terraform {
  required_version = "~>0.12.8"
  backend "gcs" {
    bucket = "crawler-app-storage"
    prefix = "terraform/state"
  }
}

provider "google" {
  version = "~>3.0.0"
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "kubernetes-cluster" {
  name               = "crawler"
  location           = var.zone
  network            = "default"
  initial_node_count = 3

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.node_disk_size

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/logging.write",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

  }

  addons_config {
    network_policy_config {
      disabled = false
    }
  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  timeouts {
    create = "20m"
    update = "10m"
  }
}

resource "google_container_node_pool" "monitoring" {
  name       = "monitoring"
  location   = var.zone
  cluster    = google_container_cluster.kubernetes-cluster.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "n1-standard-2"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      monitoring = true
    }
  }

}

resource "google_compute_firewall" "kubernetes-nodeports" {
  name    = "kubernetes-nodeports-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }
}
