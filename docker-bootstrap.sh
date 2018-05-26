#!/usr/bin/env sh

# build
go build -gcflags='-N -l' ./simple-http.go
dlv debug --headless --listen=:2345 --api-version=2 --log