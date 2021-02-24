resource "google_sql_database_instance" "admin" {
    name = var.name
    region = var.db_region
    database_version = var.database_version

    settings {
        tier = var.tier
        disk_size = var.disk_size
        replication_type = var.replication_type
        activation_policy = var.activation_policy
    }

}