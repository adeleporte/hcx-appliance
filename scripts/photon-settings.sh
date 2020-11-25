#!/bin/bash -eux

##
## Misc configuration
##

echo '> Disable IPv6'
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf

echo '> Applying latest Updates...'
tdnf -y update

echo '> Installing Additional Packages...'
tdnf install -y \
  less \
  logrotate \
  wget \
  unzip \
  tar \
  nginx

echo '> Add Terraform BITS'
wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
unzip terraform_0.13.5_linux_amd64.zip
rm terraform_0.13.5_linux_amd64.zip
chmod +x terraform
mv terraform /usr/local/bin

mkdir -p ~/hcx/01-setup
mkdir -p ~/hcx/02-config

cd ~/hcx/01-setup
wget https://raw.githubusercontent.com/adeleporte/lab-hcx/main/setup.tf
terraform init

cd ~/hcx/02-config
wget https://raw.githubusercontent.com/adeleporte/lab-hcx/main/config.tf
terraform init

echo '> Done'
