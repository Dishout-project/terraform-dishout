#!/bin/bash

# Create dishout user
useradd -m -d /home/dishout dishout && usermod --shell /bin/bash dishout


# install dependencies
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - 2>&1 
sudo apt-get install -y nodejs
sudo apt install git -y 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update
sudo apt install docker-ce -y

# Add dishout user to docker group
sudo usermod -aG docker dishout


# Cloning backend
# su - dishout -c "git clone https://github.com/Dishout-project/dishout-frontend.git --single-branch --branch development"
su - dishout -c "docker run -p 5000:5000 --name dishout-backend fortunexfortune/dishout-backend"


