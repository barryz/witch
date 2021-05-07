ENABLE_VENDOR=1
export GOPATH=$(shell echo $$GOPATH:`pwd`)
export GO15VENDOREXPERIMENT=${ENABLE_VENDOR}
GO_PKGS=$(shell go list ./... | grep -v '/vendor/')

default: build

build:
	go build -o bin/witch 

build-linux:
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o bin/witch-linux

dep:
	go mod tidy

.PHONY: witch
