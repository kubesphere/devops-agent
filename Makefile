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

build-maven-jdk11:
	docker build maven -f maven/Dockerfile -t kubespheredev/builder-maven:$(VERSION)-jdk11 \
--build-arg JDK_VERSION=11
push-maven-jdk11:
	docker push kubespheredev/builder-maven:$(VERSION)-jdk11

build-maven-jdk17:
	docker build maven -f maven/Dockerfile -t kubespheredev/builder-maven:$(VERSION)-jdk17 \
--build-arg JDK_VERSION=17 --build-arg JDK_HOME=/usr/java/default
push-maven-jdk17:
	docker push kubespheredev/builder-maven:$(VERSION)-jdk17

build-maven-jdk17-podman:
	docker build maven -f maven/podman/Dockerfile -t kubespheredev/builder-maven:$(VERSION)-jdk17-podman \
--build-arg JDK_VERSION=17 --build-arg JDK_HOME=/usr/java/default
push-maven-jdk17-podman:
	docker push kubespheredev/builder-maven:$(VERSION)-jdk17-podman
