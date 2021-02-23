

resource "google_compute_instance" "default" {
    count = length(var.name_count)
    name = count.index+1
    machine_type = var.machine_type["prod"]
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


