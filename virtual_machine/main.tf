locals {
  name = "list-${var.name1}-${var.name2}-${var.name3}"
}

resource "google_compute_instance" "default" {
    count = "1"
    name = local.name
    # conditional (IF statements)
    machine_type = var.environment == "production" ? var.machine_type : var.machine_type_dev 
    zone = "us-west1-a"
    can_ip_forward = false
    description = "This is our Virtual Machine"
    
      tags = ["allow-http", "allow-https"] # FIREWALL
    
    boot_disk {
      initialize_params {
          image = var.image
          size = "20"
      }
    }

    labels = {
      name = "count.index+1"
      machine_type = var.environment == "production" ? var.machine_type : var.machine_type_dev
    }

    network_interface {
      network = "default" 
    }

    metadata = {
      "size" = "20"
      foo = "bar"
    }

    metadata_startup_script = "echo hi > /test.txt"

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}

resource "google_compute_disk" "default" {
  name = "test-desk"
  type = "pd-ssd"
  zone = "us-west1-a"
  size = "10"
}

resource "google_compute_attached_disk" "default" {
  disk = "google_compute_instance.default.self_link"
  instance = "google_compute_instance.default[0].self_link"
}