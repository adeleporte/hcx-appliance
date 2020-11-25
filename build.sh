#!/bin/bash -x

echo "Building HCX Automation Appliance ..."
rm -rf output-vmware-iso
packer build -var-file=photon-version.json photon.json
