FROM golang:alpine

RUN mkdir -p /go/src/github.com/djordjev/docker-debugger

WORKDIR /go/src/github.com/djordjev/docker-debugger

ADD . .

RUN apk add --no-cache git
#RUN go get github.com/codegangsta/gin

RUN go get github.com/derekparker/delve/cmd/dlv
RUN apk add --no-cache gcc musl-dev

RUN ["chmod", "+x", "./docker-bootstrap.sh"]


EXPOSE 3001
EXPOSE 2345

ENTRYPOINT ["./docker-bootstrap.sh"]