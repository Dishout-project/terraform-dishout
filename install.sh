#! /bin/bash

set -e 

echo "Installing Terraform"
sudo apt-get install curl -y
export VER="0.13.2"
cd
curl https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip --output terraform_${VER}_linux_amd64.zip
sudo apt-get install -y unzip
unzip terraform_${VER}_linux_amd64.zip
test ! -f /bin/terraform && sudo mkdir /bin/terraform
sudo mv terraform /usr/local/bin/
rm -fR terraform_${VER}_linux_amd64.zip
terraform -version

echo ""
echo "Installing Ansible"
sudo apt-get update -y
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible
ansible --version

echo ""
echo "Installing GCP libraries, required for ansible dynamic provisioning"
sudo apt install python-pip -y
pip install requests 
pip install google-auth