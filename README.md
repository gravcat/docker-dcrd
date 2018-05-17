###### credit to https://github.com/Reiuiji/docker-dcrd, where I forked from

## Decred Daemon Dockerfile

This repository maintains the [Decred daemon](http://decred.org/) **Dockerfile** for [Docker](https://www.docker.com/).

The repo [automatically builds](https://registry.hub.docker.com/u/nthieling/docker-dcrd/) and publishes the docker image to the [Docker Hub Registry](https://registry.hub.docker.com/).

#### Base Docker Image

* [alpine:latest](https://hub.docker.com/_/alpine/)

#### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/reiuiji/dcrd/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

    `docker pull nthieling/docker-dcrd`

   (alternatively, you can build an image from Dockerfile)

#### Building
To build this docker container run the following commands after you edited the dcrd.conf file
````bash
docker build -t="nthieling/docker-dcrd" github.com/gravcat/docker-dcrd
````

#### Usage
This docker image can either be configured before build or attach the config.

##### If you want to change the provided dcrd.conf, you should do the following:
````bash
docker cp /path/to/your/dcrd.conf:/data/dcrd.conf
````
##### Run your dcrd container

````bash
docker run -d --name="dcrd" nthieling/docker-dcrd
````
##### If you need to expose RPC ports

````bash
docker run -d -p 9109:9109 --name dcrd nthieling/docker-dcrd
````
##### If you only want to tweak the dcrd.conf, you can run a temp link:

````bash
docker run -d -p 9109:9109 --name dcrd -v /path/to/your/dcrd.conf:data/dcrd.conf nthieling/docker-dcrd
````
##### If you want to run with the built in volume of the entire dcrd daemon:

````bash
docker run -d --name="dcrd" -v /path/to/your/.dcrd/data:/data nthieling/docker-dcrd
````
**NOTE**: Make sure the directory on your system have the `dcrd.conf` file

#### Checking if it works
To check if `dcrd` is working you can check the docker logs

````bash
docker logs dcrd
````
#### Shutting down the docker container
If you need to close down the docker container you can run the following:

````bash
docker kill --signal=SIGINT dcrd
````
**NOTE**: sending a SIGINT (crtl+c) will have `dcrd` shutdown safely

#### References
 * [docker cheat sheet](https://github.com/wsargent/docker-cheat-sheet)
 * [dcrd](https://github.com/decred/dcrd)
