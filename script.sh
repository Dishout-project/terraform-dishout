
#! /bin/bash
set -e
terraform apply -auto-approve
cd provisioner && ansible-playbook playbook.yml 