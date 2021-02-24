resource "google_compute_network" "terraform" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network" {
    name = "terrform-subnet"
    ip_cidr_range = "10.2.0.0/16"
    region = "us-west1"
    network = "google_compute_network.terraform.self_link"
}