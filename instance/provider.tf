variable "path" {
    default = "../credentials"
  
}

provider "google" {

    project = "terraform-project-demo"
    region = "us-west1"
    credentials = "${file("${var.path}/terraform-secrets.json")}"
} 