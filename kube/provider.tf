provider "google" {

    project = "terraform-project-demo"
    region = "us-west1"
    credentials = "../credentials/terraform-secrets.json"
} 

provider "google-beta" {

    project = "terraform-project-demo"
    region = "us-west1"
    credentials = "../credentials/terraform-secrets.json"
} 