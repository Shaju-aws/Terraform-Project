locals {
    private_sg_id = data.aws_ssm_parameter.private_sg_id.value
    private_subnet_id = data.aws_ssm_parameter.private_subnet_id.value
}

locals {
    common_name = "${var.project}-${var.environment}"
    common_tags = {
        Project = var.project
        Environment = var.environment
        terrform = "true"
    }
}