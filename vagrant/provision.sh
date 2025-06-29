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
echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bashrc
echo "export GOPATH=$HOME/go" >> /home/vagrant/.bashrc
echo "export PATH=$GOPATH/bin:$PATH" >> /home/vagrant/.bashrc

# debugger
go install github.com/go-delve/delve/cmd/dlv@v1.24.0

# optional gbd
sudo apt-get install gdb -y

# force startup folder to vagrant project
echo "cd /vagrant/src" >> /home/vagrant/.bashrc