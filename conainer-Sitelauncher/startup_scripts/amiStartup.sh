#!bin/bash
yum update -y
yum install httpd -y 
systemctl start httpd
systemctl enable httpd
sudo systemctl stop httpd
sudo systemctl disable httpd # optional, prevents it from restarting on reboot
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER