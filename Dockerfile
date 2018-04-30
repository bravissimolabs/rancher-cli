# Pull base image.
FROM alpine:latest

# Define rancher compose version
ENV RANCHER_CLI_VERSION v0.6.8

# Download and install rancher compose at specified version
RUN apk update && \
		apk add ca-certificates wget && \
		wget -qO- https://github.com/rancher/cli/releases/download/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz | tar xvz -C /tmp && \
		mv /tmp/rancher-${RANCHER_CLI_VERSION}/rancher /usr/local/bin/rancher && \
		chmod +x /usr/local/bin/rancher

RUN apk --no-cache add curl 

# Define working directory.
WORKDIR /workspace