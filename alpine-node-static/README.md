# alpine-node-static
This is a Docker image with Alpine Linux running a simple node-static http server. You may volume-mount your local static files to get served.

# Usage
```bash

docker run \
	--rm \
	--name alpine-node-static \
	-v "<path-to-local-dir>:/var/www" \
	-p "8080:3000"
	chiefy/alpine-node-static:latest
```
