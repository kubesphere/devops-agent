#!/usr/bin/env bash

ARCH=$(uname -m)

echo $ARCH

if [[ ${ARCH} == 'x86_64' ]]; then
  # Install runc for podman
  wget https://github.com/opencontainers/runc/releases/download/v1.1.10/runc.amd64 && \
    mv runc.amd64 /usr/bin/runc && chmod +x /usr/bin/runc
  # Install conmon for podman
  wget https://github.com/containers/conmon/releases/download/v2.1.0/conmon.amd64 && \
    mv conmon.amd64 /usr/bin/conmon && chmod +x /usr/bin/conmon

elif [[ ${ARCH} == 'aarch64' ]]
then
  # Install runc for podman
  wget https://github.com/opencontainers/runc/releases/download/v1.1.10/runc.arm64 && \
      mv runc.arm64 /usr/bin/runc && chmod +x /usr/bin/runc
  # Install conmon for podman
  wget https://github.com/containers/conmon/releases/download/v2.1.0/conmon.arm64 && \
      mv conmon.arm64 /usr/bin/conmon && chmod +x /usr/bin/conmon
else
  echo "do not support this arch"
  exit 1
fi

# Install podman
wget https://github.com/containers/podman/archive/refs/tags/v3.4.4.tar.gz && \
tar -zxf v3.4.4.tar.gz && \
cd podman-3.4.4 && make BUILDTAGS="selinux seccomp systemd" PREFIX=/usr && make install PREFIX=/usr && \
cd .. && rm v3.4.4.tar.gz && rm -rf podman-3.4.4 && rm -rf go && \
ln -s /usr/bin/podman /usr/bin/docker
