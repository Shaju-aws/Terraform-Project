#!/bin/bash

component=$1
dnf install ansible -y
mkdir -p /var/log/ansible
chown -R 775 /var/log/ansible
chown -R ec2-user:ec2-user /var/log/ansible

cd /home/ec2-user
git clone https://github.com/Shaju-aws/Terraform-Project.git
cd /home/ec2-user/Terraform-Project/ansible-project
git pull
ansible-playbook -i inventory.ini roboshop2.yaml -e "component=$component"