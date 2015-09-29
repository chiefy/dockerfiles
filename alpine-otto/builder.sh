#!/bin/bash

gopath=/gopath/src/github.com/hashicorp/otto
version=0.1.1


clean() {
  rm -rf ./otto
}

if [[ -d "otto" ]]; then
  clean
fi

if [[ ! -d "pkg" ]]; then
  mkdir -p pkg
else
  rm -rf pkg/*
fi

git clone git@github.com:/hashicorp/otto
pushd otto

docker run \
    --rm \
    --volume $(pwd):$gopath \
    --workdir $gopath \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    quay.io/chiefy/alpine-linux-build \
    sh -c "make updatedeps && XC_ARCH=amd64 XC_OS=linux ./scripts/build.sh"

mv pkg/linux_amd64/otto ../pkg/otto && popd && clean

docker build -t chiefy/alpine-otto:$version .
