#!/usr/bin/env bash

ARCH=$(uname -m)

echo $ARCH

rm -rf /usr/bin/ks

# ks
KS_VERSION=0.0.73
if [[ ${ARCH} == 'x86_64' ]]; then
  curl -fL https://github.com/kubesphere-sigs/ks/releases/download/v${KS_VERSION}/ks-linux-amd64.tar.gz | tar xzv && \
  mv ks /usr/bin/
elif [[ ${ARCH} == 'aarch64' ]]
then
  curl -fL https://github.com/kubesphere-sigs/ks/releases/download/v${KS_VERSION}/ks-linux-arm64.tar.gz | tar xzv && \
  mv ks /usr/bin/
else
  echo "do not support this arch"
  exit 1
fi
