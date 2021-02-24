# Instance Template <- Describe Instance

resource "google_compute_instance_template" "instance_template" {
    count = 1
    name = "terraform-server-${count.index+1}"
    description = "This is our autoscaling instances"
    # tags = [] # networking

    labels = {
      environment = "production"
      name = "terraform-server-${count.index+1}"
    }

    instance_description = "This is an instance that has been auto scaled"
    machine_type = var.machine_type
    can_ip_forward = false

    scheduling {
        automatic_restart = true
        on_host_maintenance = "MIGRATE"
    }

    disk {
        source_image = var.image
        auto_delete = true
        boot = true
    }
    disk {
        source_image = var.image
        auto_delete = false
        disk_size_gb = 10
        mode = "READ_WRITE"
        type = "PERSISTENT"
    }

    network_interface {
      network = "default"
    }

    metadata = {
        foo = "bar"
    }

     service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }


}

# Health Check <-- Auto Scaling Policy 

resource "google_compute_health_check" "health" {
    count = 1
    name = "health-check"
    check_interval_sec = 5
    timeout_sec = 5
    healthy_threshold = 2
    unhealthy_threshold = 10

    http_health_check {
        request_path = "/alive.jsp"
        port = "8080"
    }
}

# Group Manager <--- Manages the Nodes

resource "google_compute_region_instance_group_manager" "test-server" {
    name = "instance-group-manager"
    base_instance_name = "instance-group-manager"
    region = var.region
    
    version {
        instance_template = "google_compute_instance_template.test-server[0].self_link"
    }
    auto_healing_policies {
        health_check = "google_compute_health_check.health.self_link"
        initial_delay_sec = 300
    }
}

# Auto Scale Policy <---- How many Instances 

resource "google_compute_region_autoscaler" "autoscaler" {
    count = 1
    name = "autoscaler"
    project = "terraform-project-demo"
    region = var.region
    target = "google_compute_region_instance_group_manager.instance_group_manager.self_link"

    autoscaling_policy {
        max_replicas = 2
        min_replicas = 1
        cooldown_period = 60
        cpu_utilization {
            target = "0.8"
        }
    }
}

