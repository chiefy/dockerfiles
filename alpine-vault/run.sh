#!/bin/bash
docker run \
	--rm \
	--name vault-dev \
	-p 8200:8200 \
	chiefy/alpine-vault:0.1.2
