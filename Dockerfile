# Use a base image with Ubuntu
FROM ubuntu:latest

# Update and upgrade packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y git make screen jq curl wget

# Download and install Go
RUN wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Verify Go installation
RUN go version

# Download and execute Foundry script
RUN curl -L https://foundry.paradigm.xyz | bash
RUN source /root/.bashrc
RUN foundryup

# Clone the Polaris repository
RUN git clone https://github.com/berachain/polaris
WORKDIR /polaris
RUN git checkout main

# Start the Polaris node
CMD ["make", "start"]
