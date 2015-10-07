# alpine-vault
This is a Docker image with Alpine Linux running the latest version of [Vault](http://vaultproject.io) by HashiCorp.

# Usage
```bash
#!/bin/bash

# Absolute path to your vault config file
MY_VAULT_CONFIG=/path/to/vault.hcl

# If you're using boot2docker, you'll need to change this to the IP of your boot2docker host
DOCKER_HOST=127.0.0.1

# Export this so you can access the vault server via CLI locally
export VAULT_ADDR=http://$DOCKER_HOST:8200

docker run \
	--rm \
	--name vault-dev \
	--memory-swap -1 \
	-v "$MY_VAULT_CONFIG:/etc/vault.hcl" \
	-p 8200:8200 \
	chiefy/alpine-vault:0.3.1

```
