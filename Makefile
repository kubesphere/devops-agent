COMMIT := $(shell git rev-parse --short HEAD)
VERSION := dev-$(shell git describe --tags $(shell git rev-list --tags --max-count=1))

build-base:
	docker buildx build base -f base/Dockerfile -t kubesphere/builder-base:$(VERSION)
