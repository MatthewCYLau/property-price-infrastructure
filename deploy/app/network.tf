/*
resource "google_compute_network" "network1" {
  name                    = "vpc-network-1"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet-1"
  ip_cidr_range = "10.10.0.0/24"
  network       = google_compute_network.network1.id
  region       = var.region
}

resource "google_compute_network" "network2" {
  name                    = "vpc-network-2"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet-2"
  ip_cidr_range = "10.20.0.0/24"
  network       = google_compute_network.network2.id
  region        = var.region
}

resource "google_compute_network_peering" "peering1to2" {
  name         = "peering-1-to-2"
  network      = google_compute_network.network1.id
  peer_network = google_compute_network.network2.id
}

resource "google_compute_network_peering" "peering2to1" {
  name         = "peering-2-to-1"
  network      = google_compute_network.network2.id
  peer_network = google_compute_network.network1.id
}
*/