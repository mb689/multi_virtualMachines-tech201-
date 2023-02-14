#!/bin/bash

# Update & Upgrade 
sudo apt-get update -y
sudo apt-get upgrade -y

# Install nginx
sudo apt-get install nginx -y

# Enable/Start nginx
sudo systemctl enable nginx -y

# Reverse proxy setup:
# Remove default nginx configuration
sudo rm /etc/nginx/sites-available/default
# Copy the reverse proxy file containing the relevant code into that location
sudo cp environment/environment/spec-tests/app/reverse_proxy.txt /etc/nginx/sites-available/default.conf
# Restart nginx to confirm changes
sudo systemctl restart nginx -y

# Install node js specific version
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# Install pm2
sudo npm install pm2 -g

echo 'export DB_HOST=mongodb://192.168.10.150:27017/posts' >> ~/.bashrc 
source .bashrc

# Install app
cd app
cd app
npm install
# Seed the Database
node seeds/seed.js



