#!/usr/bin/env bash


ARCH=$(uname -m)

echo $ARCH

# GOLANG
if [[ ${ARCH} == 'x86_64' ]]; then
  wget https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz && \
  tar -C /usr/local -xzf go$GOLANG_VERSION.linux-amd64.tar.gz && \
  rm go${GOLANG_VERSION}.linux-amd64.tar.gz
elif [[ ${ARCH} == 'aarch64' ]]
then
  wget https://golang.org/dl/go$GOLANG_VERSION.linux-arm64.tar.gz && \
  tar -C /usr/local -xzf go$GOLANG_VERSION.linux-arm64.tar.gz && \
  rm go${GOLANG_VERSION}.linux-arm64.tar.gz
else
  echo "do not support this arch"
  exit 1
fi
