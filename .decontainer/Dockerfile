# build locally with : docker build .
FROM ubuntu:20.04

COPY . .

ENV PATH "$PATH:/usr/local/go/bin:/home/user/go/bin:/home/user/.cargo/bin"
RUN apt-get update \
    && apt-get install -y curl git wget jq \
    && useradd -m user \
    && su user \
    && wget https://golang.org/dl/go1.24.4.linux-amd64.tar.gz \
    && rm -rf /usr/local/go \
    && tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz \
    && rm go1.24.4.linux-amd64.tar.gz \
    && echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc \

RUN go version \
    && echo "export GOROOT=/usr/local/go" >> ~/.bashrc \
    && echo "export GOPATH=/vagrant" >> ~/.bashrc 

run go install -u golang.org/x/tools/gopls@v0.15.3

USER user