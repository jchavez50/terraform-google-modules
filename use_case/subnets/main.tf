resource "google_compute_network" "terraform" {
    name = "terraform-network"
    auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "network1" {
    name = "terrform-subnet"
    ip_cidr_range = "10.2.0.0/16"
    region = "us-west1"
    network = "google_compute_network.terraform.self_link"
}

resource "google_compute_subnetwork" "network2" {
    name = "terrform-subnet"
    ip_cidr_range = "10.3.0.0/16"
    region = "us-west2"
    network = "google_compute_network.terraform.self_link"
}

resource "google_compute_subnetwork" "network3" {
    name = "terrform-subnet"
    ip_cidr_range = "10.4.0.0/16"
    region = "us-central1"
    network = "google_compute_network.terraform.self_link"
}

resource "google_compute_subnetwork" "network4" {
    name = "terrform-subnet"
    ip_cidr_range = "10.5.0.0/16"
    region = "us-central2"
    network = "google_compute_network.terraform.self_link"
}
