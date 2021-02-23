output "machine_type" { value = "${google_compute_instance.default.*.machine_type}"}
output "name" { value = "${google_compute_instance.default.*.name}"}
output "zone" { value="${google_compute_instance.default.*.zone}"}
