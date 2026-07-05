locals {
    database_sg_id = data.aws_ssm_parameter.mongo_sg_id.value
    database_subnet_ids = data.aws_ssm_parameter.database_subnet_ids.value
}

locals {
    common_name = "${var.project}-${var.environment}"
    common_tags = {
        Project = var.project
        Environment = var.environment
        terrform = "true"
    }
}