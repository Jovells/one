# Use a base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update -y && apt-get -y install curl tar ca-certificates

# Download and install the application
WORKDIR /app
RUN curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz \
    && tar -zxf apphub-linux-amd64.tar.gz \
    && rm -f apphub-linux-amd64.tar.gz \
    && cd ./apphub-linux-amd64 \
    && ./apphub service install

# Start the service
CMD ["./apphub-linux-amd64/apphub", "service", "start"]
