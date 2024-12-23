IMAGE_NAME=$(shell basename $(shell pwd))

.PHONY: build
build:
	@docker build -t ghcr.io/chiefy/$(IMAGE_NAME):latest .