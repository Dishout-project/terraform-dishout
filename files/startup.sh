#!/bin/bash

# install dependencies
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - 2>&1 
sudo apt-get install -y nodejs
sudo apt install git -y 
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

sudo apt update
sudo apt install docker-ce -y

# Create dishout user and add to docker group
useradd -m -d /home/dishout dishout && usermod --shell /bin/bash dishout
sudo usermod -aG docker dishout


# Cloning frontend
# su - dishout -c "git clone https://github.com/Dishout-project/dishout-frontend.git --single-branch --branch development"
su - dishout -c "docker run -p 80:80 --name dishout-frontend fortunexfortune/dishout-frontend"

# pwd 2>&1 | tee -a SomeFile.txt

# # Installing node dependencies
# npm install 2>&1 | tee -a SomeFile.txt
# npm start 2>&1 | tee -a SomeFile.txt

# cat << EOF > /etc/systemd/system/dishout-frontend.service
# [Unit]
# Description=Dishout Frontend

# [Service]
# User=root

# WorkingDirectory=/dishout-frontend
# ExecStartPre=/usr/bin/npm install 2>&1 | tee -a /SomeFile.txt
# ExecStart=/usr/bin/npm start

# [Install]
# WantedBy=multi-user.target
# EOF

# systemctl daemon-reload
# systemctl start dishout-frontend.service

