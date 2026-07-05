resource "aws_instance" "bamongodbstion" {
  ami                    = data.aws_ami.joindevops.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.database_sg_id]
  subnet_id              = local.database_subnet_ids

  tags = merge(
    {
      Name = "${local.common_name}-mongodb"
    },
    local.common_tags
  )
}

resource "terraform_data" "bootstrap" {
    triggers_replace = [aws_instance.mongodb.id]

    connection {
        type        = "ssh"
        host        = aws_instance.mongodb.private_ip
        user        = "ec2-user"
        password    = "DevOps321"
    }

    provisioner "file" {
      source = "bootstrap.sh"
      destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/bootstrap.sh",
            "sudo sh /tmp/bootstrap.sh mongodb"
        ]
    }
}

