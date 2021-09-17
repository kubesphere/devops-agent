COMMIT := $(shell git rev-parse --short HEAD)
VERSION := dev-$(shell git describe --tags $(shell git rev-list --tags --max-count=1))

build-base-podman:
	docker build base -f base/podman/Dockerfile -t kubespheredev/builder-base:$(VERSION)-podman
push-base-podman:
	docker push kubespheredev/builder-base:$(VERSION)-podman

build-maven-podman:
	docker build maven -f maven/podman/Dockerfile -t kubespheredev/builder-maven:$(VERSION)-podman
push-maven-podman:
	docker push kubespheredev/builder-maven:$(VERSION)-podman

build-jdk11:
	docker build maven -f maven/Dockerfile -t kubespheredev/builder-maven:$(VERSION)-jdk11 --build-arg JDK_VERSION=11
