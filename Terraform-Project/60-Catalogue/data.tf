data "aws_ssm_parameter" "private_sg_id" {
    name = "/${var.project}/${var.environment}/private_sg_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project}/${var.environment}/private_subnet_id"
}

data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}