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
