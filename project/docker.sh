#!/bin/bash
# First check if there are any updates
sudo apt-get update -y
# allow apt to use repositories over the HTTPS protocol
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

# Add docker's official GPG key by executing following command
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker's repositories
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update and install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y


#Installing ansible
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y
