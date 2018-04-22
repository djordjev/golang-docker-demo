FROM golang:alpine

RUN mkdir -p /go/src/github.com/djordjev/docker-debugger

WORKDIR /go/src/github.com/djordjev/docker-debugger

ADD . .

RUN apk add --no-cache git
RUN go get github.com/codegangsta/gin

RUN go build ./simple-http.go


EXPOSE 3000

ENTRYPOINT ["gin", "run", "simple-http.go"]