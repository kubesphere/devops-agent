[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/kubesphere/devops-agent)

# KubeSphere DevOps Agent

## Introduction

In [KubeSphere](https://kubesphere.io/) DevOps, the pipeline runs on the agent of Jenkins. The agent depends on the [kubernetes-plugin](https://github.com/jenkinsci/kubernetes-plugin). It's necessary to provide Kubernetes a podTemplate, and the podTemplate defines the agent.

The definition method of podTemplate is:

```bash
podTemplate(containers: [
    containerTemplate(name: 'base', image: 'kubesphere/builder-base:latest', ttyEnabled: true, command: 'cat')
])
```

This repo stores the build files of image for these podTemplate. 

Welcome to contribute.

## Images
Images for both production and development:

| Name                      | Introduction             | Docker Pulls                                                                                                                              |
|---------------------------|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| `kubesphere/builder-base` | [README](base/README.md) | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-base.svg)](https://hub.docker.com/r/kubesphere/builder-base/tags) |

**NOTE**
1. The image with tag `x.y.z-podman` has the very same utilities installed compared to the `x.y.z` image, the only difference is that the `x.y.z-podman` image makes a symbolic link of `docker` to `podman`, for easy use and backward compatibility.

## Legacy Images
Legacy images built on centos:7 are no longer developed but may be still working.

For production:

| Name | Docker Pulls |
|---|---|
| `kubesphere/builder-go` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-go.svg)](https://hub.docker.com/r/kubesphere/builder-go/tags) |
| `kubesphere/builder-maven` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-maven.svg)](https://hub.docker.com/r/kubesphere/builder-maven/tags) |
| `kubesphere/builder-gradle` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-gradle.svg)](https://hub.docker.com/r/kubesphere/builder-gradle/tags) |
| `kubesphere/builder-nodejs` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-nodejs.svg)](https://hub.docker.com/r/kubesphere/builder-nodejs/tags) |
| `kubesphere/builder-dotnet` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-dotnet.svg)](https://hub.docker.com/r/kubesphere/builder-dotnet/tags) |
| `kubesphere/builder-python` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-python.svg)](https://hub.docker.com/r/kubesphere/builder-python/tags) |

For development:

| Name | Docker Pulls |
|---|---|
| `kubespheredev/builder-go` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-go.svg)](https://hub.docker.com/r/kubespheredev/builder-go/tags) |
| `kubespheredev/builder-maven` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-maven.svg)](https://hub.docker.com/r/kubespheredev/builder-maven/tags) |
| `kubespheredev/builder-gradle` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-gradle.svg)](https://hub.docker.com/r/kubespheredev/builder-gradle/tags) |
| `kubespheredev/builder-nodejs` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-nodejs.svg)](https://hub.docker.com/r/kubespheredev/builder-nodejs/tags) |
| `kubespheredev/builder-dotnet` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-dotnet.svg)](https://hub.docker.com/r/kubespheredev/builder-dotnet/tags) |
| `kubespheredev/builder-python` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-python.svg)](https://hub.docker.com/r/kubespheredev/builder-python/tags) |

## How to Build
Check out the Makefile.

For example, build the base image:

```bash
make build-base
```

## Join & Contact Community

- Slack [#sig-devops](https://kubesphere.slack.com/messages/sig-devops)
- [Twitter](https://twitter.com/KubeSphere)
- Mailing list [archive](https://groups.google.com/group/kubesphere-sig-devops/topics) | [subscribe](mailto:kubesphere-sig-devops+subscribe@googlegroups.com) | [unsubscribe](mailto:kubesphere-sig-devops+unsubscribe@googlegroups.com)
- [Medium (Blog)](https://itnext.io/@kubesphere)

