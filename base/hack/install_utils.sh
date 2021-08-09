#!/usr/bin/env bash

ARCH=$(uname -m)

echo $ARCH

if [[ ${EXCLUDE_DOCKER} != '1' ]]; then
  # Docker
  DOCKER_VERSION=18.09.9
  if [[ ${ARCH} == 'x86_64' ]]; then
    curl -f https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | tar xvz && \
    mv docker/docker /usr/bin/ && \
    rm -rf docker
  elif [[ ${ARCH} == 'aarch64' ]]
  then
    curl -f https://download.docker.com/linux/static/stable/aarch64/docker-$DOCKER_VERSION.tgz | tar xvz && \
    mv docker/docker /usr/bin/ && \
    rm -rf docker
  else
    echo "do not support this arch"
    exit 1
  fi
fi

# Helm
HELM_VERSION=2.11.0
HELM3_VERSIOIN=3.5.0

if [[ ${ARCH} == 'x86_64' ]]; then
  curl -f https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz  | tar xzv && \
  mv linux-amd64/helm /usr/bin/ && \
  mv linux-amd64/tiller /usr/bin/ && \
  rm -rf linux-amd64

  curl -f https://get.helm.sh/helm-v${HELM3_VERSIOIN}-linux-amd64.tar.gz | tar xzv && \
  mv linux-amd64/helm /usr/bin/helm3 && \
  rm -rf linux-amd64 
elif [[ ${ARCH} == 'aarch64' ]]
then
  curl -f https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-arm64.tar.gz  | tar xzv && \
  mv linux-arm64/helm /usr/bin/ && \
  mv linux-arm64/tiller /usr/bin/ && \
  rm -rf linux-arm64

  curl -f https://get.helm.sh/helm-v${HELM3_VERSIOIN}-linux-arm64.tar.gz | tar xzv && \
  mv linux-arm64/helm /usr/bin/helm3 && \
  rm -rf linux-arm64 
else
  echo "do not support this arch"
  exit 1
fi

# kubectl

if [[ ${ARCH} == 'x86_64' ]]; then
  curl -f -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/
elif [[ ${ARCH} == 'aarch64' ]]
then
  curl -f -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/ && kubectl --help
else
  echo "do not support this arch"
  exit 1
fi
