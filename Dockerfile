# Use a base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update -y
RUN apt-get -y install curl tar ca-certificates

# Download the application
WORKDIR /app
RUN curl -o apphub-linux-386.tar.gz https://assets.coreservice.io/public/package/70/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz

# Extract the application
RUN tar -zxf apphub-linux-386.tar.gz
RUN rm -f apphub-linux-386.tar.gz

# Change directory to the apphub installation directory
WORKDIR /app/apphub-linux-386

# Install the service
RUN ./apphub service install

# Start the service
CMD ["./apphub", "service", "start"]
