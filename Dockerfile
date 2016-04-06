#
# Decred Release Docker File
#

# Pull base image.
FROM centos:7
MAINTAINER "Reiuiji" <reiuiji@gmail.com>

# Install dcrd
RUN \
mkdir -p /dcrd && \
curl -L https://github.com/decred/decred-release/releases/download/v0.0.9/linux-amd64-20160401-01.tar.gz | tar zxvf - --strip-components=1 -C /dcrd linux-amd64/dcrd


RUN ls -lh /
RUN ls -lh /dcrd

# Define working directory.
WORKDIR /dcrd

# Define default command.
#CMD ["/dcrd/dcrd"]

ENTRYPOINT /dcrd/dcrd

# Expose Ports
EXPOSE 9108
EXPOSE 9109
