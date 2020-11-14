
#! /bin/bash
set -e
terraform apply -auto-approve
# terraform apply 
cd provisioner && ansible-playbook playbook.yml 





# anibsle use lables to manage invenotry, duckdns

# add instruction on how to properly serup .tfvar duckdns tokken and wheret okeen can be found
