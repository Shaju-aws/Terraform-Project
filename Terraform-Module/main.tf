module "vpc" {
    source = "../Terraform-3tier-VPC"
    project = "roboshop"
    environment = "dev"
    vpc_tags = {}
    igw_tags = {}
    subnet_tags = {}

    is_peering_required = false

}