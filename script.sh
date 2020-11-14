
#! /bin/bash
set -e
# terraform apply -auto-approve
terraform apply 
cd provisioner && ansible-playbook playbook.yml 


#ansible-galaxy collection install community.general