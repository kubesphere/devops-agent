[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/kubesphere/devops-agent)

# KubeSphere DevOps Agent

## Introduction

In [KubeSphere](https://kubesphere.io/) DevOps, the pipeline runs on the agent of Jenkins. The agent depends on the [kubernetes-plugin](https://github.com/jenkinsci/kubernetes-plugin). It's necessary to provide Kubernetes a podTemplate, and the podTemplate defines the agent.

The definition method of podTemplate is:

```bash
podTemplate(containers: [
    containerTemplate(name: 'base', image: 'kubesphere/builder-base:v2.1.0', ttyEnabled: true, command: 'cat')
])
```

This repo stores the build files of image for these podTemplate. 

Welcome to contribute.

## Imagess

For production:

| Name | Docker Pulls |
|---|---|
| `kubesphere/builder-base` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-base.svg)](https://hub.docker.com/r/kubesphere/builder-base/tags) |
| `kubesphere/builder-go` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-go.svg)](https://hub.docker.com/r/kubesphere/builder-go/tags) |
| `kubesphere/builder-maven` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-maven.svg)](https://hub.docker.com/r/kubesphere/builder-maven/tags) |
| `kubesphere/builder-nodejs` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-nodejs.svg)](https://hub.docker.com/r/kubesphere/builder-nodejs/tags) |
| `kubesphere/builder-dotnet` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubesphere/builder-dotnet.svg)](https://hub.docker.com/r/kubesphere/builder-dotnet/tags) |


For development:

| Name | Docker Pulls |
|---|---|
| `kubespheredev/builder-base` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-base.svg)](https://hub.docker.com/r/kubespheredev/builder-base/tags) |
| `kubespheredev/builder-go` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-go.svg)](https://hub.docker.com/r/kubespheredev/builder-go/tags) |
| `kubespheredev/builder-maven` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-maven.svg)](https://hub.docker.com/r/kubespheredev/builder-maven/tags) |
| `kubespheredev/builder-nodejs` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-nodejs.svg)](https://hub.docker.com/r/kubespheredev/builder-nodejs/tags) |
| `kubespheredev/builder-dotnet` | [![Docker Pulls](https://img.shields.io/docker/pulls/kubespheredev/builder-dotnet.svg)](https://hub.docker.com/r/kubespheredev/builder-dotnet/tags) |

## How to Build

Enter the directory and execute:

```bash
docker build -f Dockerfile .
```

It's a better way to provide jenkinsfile for compiling images, like base agent.

## Join & Contact Community

- Slack [#sig-devops](https://kubesphere.slack.com/messages/sig-devops)
- [Twitter](https://twitter.com/KubeSphere)
- Mailing list [archive](https://groups.google.com/group/kubesphere-sig-devops/topics) | [subscribe](mailto:kubesphere-sig-devops+subscribe@googlegroups.com) | [unsubscribe](mailto:kubesphere-sig-devops+unsubscribe@googlegroups.com)
- [Medium (Blog)](https://itnext.io/@kubesphere)

