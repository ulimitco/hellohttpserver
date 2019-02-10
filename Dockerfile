FROM golang:1.11.5
COPY go.* /go/src/github.com/ulimit/hellohttpserver/
COPY *.go /go/src/github.com/ulimit/hellohttpserver/
COPY vendor/ /go/src/github.com/ulimit/hellohttpserver/vendor/
WORKDIR /go/src/github.com/ulimit/hellohttpserver/
RUN GO111MODULE=on GOFLAGS=-mod=vendor CGO_ENABLED=0 GOOS=linux go build -v -a -installsuffix cgo -o hellohttpserver .

FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y ca-certificates
WORKDIR /hellohttpserver/
COPY --from=0 /go/src/github.com/ulimit/hellohttpserver .
ENTRYPOINT ["/hellohttpserver/hellohttpserver"]
