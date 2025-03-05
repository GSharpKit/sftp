VERSION=1.0

all: build tag

release: pull build tag push

pull:
	#podman pull registry.access.redhat.com/ubi9/ubi-minimal
	podman pull debian:bookworm

build:
	podman build --format=docker --no-cache -t xmedicus-sftp .

tag:
	podman tag xmedicus-sftp xmedicus/xmedicus-sftp:${VERSION}

push:
	podman push xmedicus/xmedicus-sftp:${VERSION}

run:
	podman run -i -t xmedicus-sftp /bin/bash
