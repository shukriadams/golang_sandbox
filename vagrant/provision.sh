#!/usr/bin/env bash
sudo apt-get update

# docker
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo usermod -aG docker vagrant

# download go
wget https://go.dev/dl/go1.23.6.linux-amd64.tar.gz -O gol.tar.gz

# remove existing go 
sudo rm -rf /usr/local/go 

# unzip download
sudo tar -C /usr/local -xzf gol.tar.gz

# set env vars that go needs to work
echo "export GOPATH=/home/vagrant/go" >> /home/vagrant/.bashrc
echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> /home/vagrant/.bashrc

# delv, go debugger
go install github.com/go-delve/delve/cmd/dlv@v1.24.0
# pls, required for go intellisense etc
go install golang.org/x/tools/gopls@v0.19.1

# force startup folder to vagrant project
echo "cd /vagrant/src" >> /home/vagrant/.bashrc