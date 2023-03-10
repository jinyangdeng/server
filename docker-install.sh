#!/bin/bash

# Source: https://docs.docker.com/engine/install/ubuntu/
# Alternative: https://github.com/docker/docker-install

sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world

systemctl start docker  
systemctl enable docker 

# pulling gitlab-ce

docker pull gitlab/gitlab-ce:latest
