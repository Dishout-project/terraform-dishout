
# Terraform-dishout
Terraform infrastructure as code for the Dishout webapp

<!-- Images -->
![Markdown Logo](files/Diagram.png)

### Installation
1) Install terraform 0.13.2

2) Create Dishout Project 

3) Service Account(grant "Project editor Role" and generate JSON key)
 
4) Ebable APis
	- Cloud storage
	- Cloud compute
	- Cloud Resource manager


#### Installing Terraform 
```
export VER="0.13.2"
sudo apt install -y curl
sudo apt-get install -y unzip
curl https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip --output terraform_${VER}_linux_amd64.zip
unzip terraform_${VER}_linux_amd64.zip
mv terraform /usr/local/bin/
rm -rf terraform_${VER}_linux_amd64.zip
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
sudo apt install --no-install-recommends python-netaddr
ansible-galaxy collection install community.general
ansible --version
```

#### Installing GCP inventory plugin (Required for ansible dynamic invenotry)
```
sudo apt install -y python-pip
pip install requests
pip install google-auth
```



#### extras
cd terraform-dishout
touch terraform.tfvars

ssh-keygen -f credential/dishout-ssh-keys -t rsa -b 4096
sudo chmod 600 credential/dishout-ssh-keys