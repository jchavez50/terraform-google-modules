# variable "path" { default = "../credentials" }

variable "image" { default="debian-cloud/debian-9" }
variable "machine_type" { 
    type = map(string)
    default = {
        "dev" = "f1-micro" 
        "prod" = "production_box_wont_work"
    }
}
# setup a list 
variable "name_count" { default = ["server1", "server2", "server3"] }
