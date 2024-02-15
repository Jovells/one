# Use a base image with Ubuntu
FROM ubuntu:latest

# Update and upgrade packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y git make jq curl wget

# Download and install Go
RUN wget https://golang.org/dl/go1.21.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Verify Go installation
RUN go version

# Clone the Polaris repository
RUN git clone https://github.com/berachain/polaris
WORKDIR /polaris
RUN git checkout main

# Build the Polaris node
RUN make build

# Start the Polaris node
CMD ["make", "start"]
