#
# Decred Release Docker File
#

# Pull base image.
FROM dockerfile/ubuntu

# Install Go
RUN \
mkdir -p /dcrd && \
curl https://github.com/decred/decred-release/releases/download/v0.0.9/linux-amd64-20160401-01.tar.gz | tar xvzf dcrd -C /dcrd --strip-components=1


# Define working directory.
WORKDIR /dcrd

# Define default command.
CMD ["dcrd"]

# Expose Ports
EXPOSE 9108
EXPOSE 9109
