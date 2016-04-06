## dcrd Dockerfile


This repository contains **Dockerfile** of [Decred daemon](http://decred.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/reiuiji/dcrd/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/reiuiji/dcrd/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull reiuiji/dcrd`

   (alternatively, you can build an image from Dockerfile: `docker build -t="reiuiji/dcrd" github.com/reiuiji/dcrd`)

### Building
docker build -t="reiuiji/dcrd" .
docker run -d --name="dcrd" reiuiji/dcrd
docker kill --signal="SIGINT" dcrd


### Usage

    docker run -d -p 9109:9109 reiuiji/dcrd

#### Attach persistent/shared directories

    docker run -d -p 9109:9109 -v <dcrd-conf-dir>:/dcrd/conf -v <certs-dir>:/dcrd/certs -v <log-dir>:/dcrd/log

After few seconds dcrd will be runing and can check through the RPC client.
