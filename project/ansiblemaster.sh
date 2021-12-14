#!/bin/bash
sudo apt-get update -y
sudo apt install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y
sudo apt-get update -y
cd .ssh/
ssh-keygen -f id_rsa -t rsa -N ''
