#! /bin/bash

export VER="0.13.2"
sudo apt install -y curl
sudo apt-get install -y unzip
curl https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip --output terraform_${VER}_linux_amd64.zip
unzip terraform_${VER}_linux_amd64.zip
mv terraform /usr/local/bin/
rm -rf terraform_${VER}_linux_amd64.zip
terraform -version