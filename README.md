## Decred Daemon Dockerfile

This repository maintains the [Decred daemon](http://decred.org/) **Dockerfile** for [Docker](https://www.docker.com/).

The repo [automatically builds](https://registry.hub.docker.com/u/reiuiji/dcrd/) and publish's the docker image to the [Docker Hub Registry](https://registry.hub.docker.com/).

### Base Docker Image

* [CentOS:Latest](https://github.com/docker-library/docs/tree/master/centos)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/reiuiji/dcrd/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

    `docker pull reiuiji/dcrd`

   (alternatively, you can build an image from Dockerfile)

### Building
To build this docker container run the following commands after you edited the dcrd.conf file

    docker build -t="reiuiji/dcrd" github.com/reiuiji/dcrd

### Usage
This docker image can either be configured before build or attach the config.

#### If you want to change the provided dcrd.conf, you should do the following:

    docker cp /path/to/your/dcrd.conf:/data/dcrf.conf

#### Run your dcrd container

    docker run -d --name="dcrd" reiuiji/dcrd

or

    docker run -d -p 9109:9109 -name dcrd reiuiji/dcrd

#### If you only want to tweak the dcrd.conf, you can run a temp link:

    docker run -d -p 9109:9109 -name dcrd -v /path/to/your/dcrd.conf:data/dcrf.conf reiuiji/dcrd

#### If you want to run with the built in volume of the entire dcrd daemon:

    docker run -d --name="dcrd" -v /path/to/your/.dcrd/data:/data reiuiji/dcrd

### Checking if it works
To check if dcrd is working you can check the docker logs

    docker logs dcrd

### Shutting down the docker container
If you need to close down the docker you can run the following:

    docker kill --signal=SIGINT dcrd

**NOTE**: sending a SIGINT (crtl+c) will have dcrd shutdown safely

### Referances
 * [docker cheat sheet](https://github.com/wsargent/docker-cheat-sheet)

### License
This code is under the MIT License.

### Donation
If you like this and want to see more, please donate :)

DsXSh151DsJpEA8mrAW5gCfVVqNCK8vQAss
