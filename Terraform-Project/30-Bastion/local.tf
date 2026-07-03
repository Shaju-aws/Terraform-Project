locals {
    public_subnet-1 = "${split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]}"
}

locals {
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
}

locals {
    common_name = "${var.project}-${var.environment}"
    common_tags = {
        Project = var.project
        Environment = var.environment
        terrform = "true"
    }
}