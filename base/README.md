Base image with latest common sdks and utilities built with ubuntu, include:
- docker cli
- podman
- kubectl
- kustomize
- helm
- jdk
- gradle
- sonar-scanner
- python
- maven
- ant
- go
- nodejs
- yarn
- npm
- ks
- ...

**NOTE**
1. Because the image has both docker and podman installed, `docker` command is no longer a alias of `podman`, you should use `podman` command explicitly.

