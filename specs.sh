#!/bin/bash

echo Information on main disk
df -h /

echo Memory info
free -h

echo Total CPUs:
echo CPUs: $(nproc)

echo CPU Model
cat /proc/cpuinfo |grep -i "Model"|head -n 2

echo Kernel and OS info
uname -a

echo Generally, KVM should not be available unless specifically enabled
if ! [ -e /dev/kvm ]; then
    echo "/dev/kvm does not exist"
else
    echo "/dev/kvm exists"
fi

echo OS
cat /etc/os-release

echo Egress IP:
curl -s -L -S https://checkip.amazonaws.com

echo Speed test of Internet
sudo pip install speedtest-cli
speedtest-cli

echo Checking Docker
docker run alpine:latest cat /etc/os-release

echo Checking User
id
