#!/bin/bash

VAULT_CONFIG=${1:?"Enter an absolute path to your vault config HCL file."}

docker run \
	--rm \
	--name vault-dev \
	--memory-swap 0 \
	-v "$VAULT_CONFIG:/etc/vault.hcl" \
	-p 8200:8200 \
	chiefy/alpine-vault:latest
