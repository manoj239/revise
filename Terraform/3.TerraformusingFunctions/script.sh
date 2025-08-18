#!/bin/bash
apt update
apt install -y unzip net-tools jq
rm -rf *.zip
rm -rf LICENSE.txt
wget https://releases.hashicorp.com/packer/1.12.0/packer_1.12.0_linux_amd64.zip
wget https://releases.hashicorp.com/terraform/1.12.1/terraform_1.12.1_linux_amd64.zip
unzip packer_1.12.0_linux_amd64.zip  && rm -rf LICENSE.txt && mv packer /usr/local/bin
unzip terraform_1.12.1_linux_amd64.zip && rm -rf LICENSE.txt && mv terraform /usr/local/bin
for I in {1..6}
do
echo "The value of I is $I"
sleep 1
done