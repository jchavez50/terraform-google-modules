variable "image" { default="debian-cloud/debian-9" }
variable "machine_type" { default = "f1-micro" }

# setup a list 
variable "name_count" { default = ["server1", "server2", "server3"] }
