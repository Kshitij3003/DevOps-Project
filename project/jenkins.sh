#!/bin/bash
sudo apt update && sudo apt install openjdk-8-jdk -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update && sudo apt-get install jenkins -y

##Installing ansible
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y
sudo apt-get update -y
cd .ssh/
ssh-keygen -f id_rsa -t rsa -N ''
