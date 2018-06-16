#!/usr/bin/env sh

# build
#go build -gcflags='-N -l' ./simple-http.go
#dlv exec ./simple-http --headless --listen=:2345 --api-version=2 --log
dlv debug ./simple-http.go --headless --accept-multiclient --listen=:2345 --api-version=2 --log