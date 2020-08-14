#!/bin/bash

# install dependencies
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - 2>&1 | tee -a SomeFile.txt
sudo apt-get install -y nodejs 2>&1 | tee -a SomeFile.txt
sudo apt install git -y 2>&1 | tee -a SomeFile.txt

# Cloning frontend
git clone https://github.com/Dishout-project/dishout-frontend.git --single-branch --branch development 2>&1 | tee -a SomeFile.txt
cd dishout-frontend
pwd 2>&1 | tee -a SomeFile.txt

# Installing node dependencies
npm install 2>&1 | tee -a SomeFile.txt
npm start 2>&1 | tee -a SomeFile.txt