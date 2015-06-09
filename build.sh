#!/bin/bash

FOLDER=${1:?"Enter a dockerfile folder."}
VERSION=$2

if [[ ! -d ${FOLDER} ]]; then
	echo "Could not find folder $(pwd)/$FOLDER, exiting."; exit 1
fi

docker build -t chiefy/$FOLDER:$VERSION $FOLDER