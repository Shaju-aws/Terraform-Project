module "vpc" {
  source      = "git::https://github.com/Shaju-aws/Terraform-Project.git//Terraform-3tier-VPC?ref=main"
  project     = var.project
  environment = var.environment

  is_peering_required = false

}
