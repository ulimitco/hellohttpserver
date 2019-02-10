## Overview
This is a simple example on how to run a Go-based http server using Docker.

## Build the image
You should already have Docker installed in your build machine. After cloning this repo, run the following commands:
```bash
$ cd <clone-directory>
$ docker build --rm .
```

The above command will use the tag `latest`. If you want to have a different tag, say `v0`:
```bash
$ docker build --rm -t hellohttpserver:v0 .
```

## Push to ulimitns (DockerHub)
```bash
$ docker login
$ docker tag hellohttpserver:v0 ulimitns/hellohttpserver:v0
$ docker push ulimitns/hellohttpserver:v0
```

## Run the server image
You can use these commands to run the images, say in a new server.
```bash
# Download the image:
$ docker pull ulimitns/hellohttpserver:v0

# Run the image:
$ docker run -d -p 8080:8080 ulimitns/hellohttpserver:v0

# Or if you want your server to autorestart when host restarts:
$ docker run -d -p 8080:8080 --restart=always ulimitns/hellohttpserver:v0

# Test the server:
$ curl -v localhost:8080/hello
```

## Cleanup (optional)
```bash
$ docker ps -a
CONTAINER ID        IMAGE                         COMMAND  STATUS ...   NAMES
8e8e4cc68279        ulimitns/hellohttpserver:v0   ...      ...    ...   agitated_hellman
# Delete the running server:
$ docker rm -f <docker-name>

```
