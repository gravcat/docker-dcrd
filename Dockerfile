#
# Decred Daemon (dcrd) Docker File
#

# Pull base image.
FROM centos:latest
MAINTAINER "Reiuiji" <reiuiji@gmail.com>

ENV VERSION=v0.0.10
ENV FILE=linux-amd64-20160406-01.tar.gz

ENV DCRURL=http://github.com/decred/decred-release/releases/download/${VERSION}/${FILE}

ENV DCRDIR=/root/.dcrd

# Create DCR Directory
RUN mkdir -p ${DCRDIR}

# Grab the dcrd.conf and put it in the image
COPY dcrd.conf ${DCRDIR}/dcrd.conf

#Download and extract the needed binary (dcrd)
RUN curl -L ${DCRURL} | tar zxvf - --strip-components=1 -C /usr/bin/. linux-amd64/dcrd

#Setup Data Volume for the decred daemon
VOLUME ${DCRDIR}

#Run decred daemon on start
CMD dcrd 

# Default Decred peer-to-peer port
EXPOSE 9108
# Default RPC port
EXPOSE 9109
