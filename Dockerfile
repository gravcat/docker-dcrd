#
# Decred Release Docker File
#

# Pull base image.
FROM centos:latest
MAINTAINER "Reiuiji" <reiuiji@gmail.com>

ENV VERSION=v0.0.9
ENV FILE=linux-amd64-20160401-01.tar.gz

ENV DCRURL=https://github.com/decred/decred-release/releases/download/${VERSION}/${FILE}

ENV DCRDIR=/root/.dcrd

# Create DCR Directory
RUN mkdir -p ${DCRDIR}

# Download and extract the necessary binary (dcrd)
RUN cd ${DCRDIR} && \
curl -L ${DCRURL} | tar zxvf - --strip-components=1 linux-amd64/dcrd 

# Grab the dcrd.conf and put it in the image
COPY dcrd.conf ${DCRDIR}/dcrd.conf

# Define working directory.
WORKDIR ${DCRDIR}

# Define default command.
#CMD ["bash"]
ENTRYPOINT ${DCRDIR}/dcrd

# Server Port
EXPOSE 9108
# RPC Server Port
EXPOSE 9109
