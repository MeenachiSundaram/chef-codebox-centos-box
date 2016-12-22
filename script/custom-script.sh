#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
echo "Installing Updates"
#Installing updates
yum -y update
echo "Installing Packages"
#Installing Packages
yum -y install wget nano emacs vim

echo "Installing Docker Repo"
#Installing Docker Repo
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

echo "Installing docker-engine"
#Installing docker-engine
yum -y install docker-engine

echo "Installing docker-compose"
#Installing docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

echo "Extracting chef-codebox.tar.gz"
mkdir /home/devops
tar -xzf /tmp/chef-codebox.tar.gz -C /home/devops/
