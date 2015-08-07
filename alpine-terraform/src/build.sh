#!/bin/bash

TAG=${1:?"Usage: \"build.sh <SEMVER-TAG>\""}
ONLY_COPY_AND_BUILD=${2:-"false"}
TERRAFORM_REL=src/github.com/hashicorp/terraform
TERRAFORM_ABS=${GOPATH}/${TERRAFORM_REL}

if [[ -z $GOPATH ]]; then
	echo "Could not find \$GOPATH, exiting."; exit 1
fi

if [[ "$ONLY_COPY_AND_BUILD" = "false"  ]]; then

	if [[ ! -d "$TERRAFORM_ABS"  ]]; then
		echo "Could not find Terraform source, cloning..."
		git clone git@github.com:hashicorp/terraform.git $TERRAFORM_ABS
	fi
	pushd $TERRAFORM_ABS && git pull origin master && git checkout "v$TAG" && popd

	docker run \
	  --rm \
	  -v "$GOPATH:/gopath" \
	  -w "/gopath/${TERRAFORM_REL}" \
	  -e "XC_OS=linux" \
	  -e "XC_ARCH=amd64" \
	  quay.io/chiefy/alpine-linux-build:latest \
	  /bin/bash -c "make updatedeps && make bin"

	if [[ $? -ne 0 ]]; then
		echo "Terraform build failed :("; exit 1
	fi

fi

if [[ ! -d "src/terraform" ]]; then
	mkdir src/terraform
fi
rm -rf src/terraform/*

cp $TERRAFORM_ABS/pkg/linux_amd64/* src/terraform \
	&& docker build -t chiefy/alpine-terraform:${TAG} .
