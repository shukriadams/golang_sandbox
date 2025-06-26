apt-get update
apt-get install -y curl git wget jq

useradd -m user
su user

wget https://golang.org/dl/go1.24.4.linux-amd64.tar.gz
rm -rf /usr/local/go 
tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz
rm go1.24.4.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

# confirm works
go version

# force startup folder to /src folder in project
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=/vagrant" >> ~/.bashrc

# install gopls, dlv, hey
