resource "google_compute_instance" "default" {
    count = 1
    name = "count.index+1"
    # conditional (IF statements)
    machine_type = var.environment == "production" ? var.machine_type : var.machine_type_dev 
    zone = "us-west1-a"

    boot_disk {
      initialize_params {
          image = var.image
      }
    }

    network_interface {
      network = "default" 
    }
    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}