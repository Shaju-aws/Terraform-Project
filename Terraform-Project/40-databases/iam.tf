resource "aws_iam_role" "mysql" {
 name = "${var.project}-${var.environment}-mysql-role"
 assume_role_policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Effect = "Allow"
       Principal = {
         Service = "ec2.amazonaws.com"
       }
       Action = "sts:AssumeRole"
     }
   ]
 })

tags = merge(
    {
        Name = "${var.project}-${var.environment}-mysql-role"
    },
    local.common_tags
)
}

resource "aws_iam_policy" "mysql" {
  name        = "${local.common_name}-mysql-policy"
  path        = "/"
  description = "Providing read only access to ssm parameters from ec2 instance for ${var.project} project in ${var.environment} environment"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("mysql-iam-policy.json")
}


resource "aws_iam_role_policy_attachment" "mysql_attachment" {
 role = aws_iam_role.mysql.name
 policy_arn = aws_iam_policy.mysql.arn
}

resource "aws_iam_instance_profile" "mysql_profile" {
 name = "${local.common_name}-mysql-profile"
 role = aws_iam_role.mysql.name
}


