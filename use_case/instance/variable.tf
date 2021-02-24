variable "image" { default="ubuntu-os-cloud/ubuntu-1804-lts" }

variable "name1" { default = "name1"}
variable "name2" { default = "name2"}
variable "name3" { default = "name3"}

variable "zone" { default = "us-west1-a"}

variable "environment" { default = "production" }

variable "machine_type_dev" { default = "f1-micro" }
variable "machine_type" { default = "n2-standard-2" }

# setup a list 
variable "name_count" { default = ["server1", "server2", "server3"] }