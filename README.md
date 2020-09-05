# terraform-dishout
Terraform infrastructure as code for the Dishout webapp


1) Install terraform 0.12

2) Create Dishout Project 

3) Service Account(grant "Project editor Role" and generate JSON key)
 
4) Ebable APis
	- Cloud storage
	- Cloud compute
	- Cloud Resource manager



terraform init
terraform valdiate
terraform plan
terraform apply
terraform destroy

#### Installing Terraform 
```
export VER="0.13.0"`
curl https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip --output terraform_${VER}_linux_amd64.zip
apt-get install -y unzip
unzip terraform_${VER}_linux_amd64.zip
mkdir /bin/terraform
mv terraform /usr/local/bin/
rm -fR terraform_${VER}_linux_amd64.zip
terraform -version
```

#### Installing ANSIBLE
```
sudo apt-get update -y
echo "Installing ansible"
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y ansible
ansible --version
```

#### Installing GCP inventory plugin
```
sudo apt install python3-pip
pip3 install requests
pip3 install google-auth

```