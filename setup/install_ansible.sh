#! /bin/bash

sudo apt-get update -y
echo "Installing ansible"
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible
sudo apt install --no-install-recommends python-netaddr
ansible-galaxy collection install community.general
ansible --version