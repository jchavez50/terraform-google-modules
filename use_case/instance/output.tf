output "machine_type" { value = google_compute_instance.default.*.machine_type }
output "name" { value = google_compute_instance.default.*.name }
output "zone" { value= google_compute_instance.default.*.zone }

# create a join
output "instance_id" { value = join(",",google_compute_instance.default.*.id)}