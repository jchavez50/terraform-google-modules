module "instance_one" {
    source = "../../virtual_machine"
    machine_type = "n1-standard-2"
}

module "instance_two" {
    source = "../../virtual_machine"
    machine_type = "n1-standard-2"
}

module "bucket" {
    source = "../../bucket"
    name = "module_test"
}

module {
    source = "github.com/jchavez50/example"
}