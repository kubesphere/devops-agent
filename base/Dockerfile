FROM ubuntu:24.04

ARG TARGETARCH

# Set working directory
WORKDIR /root

ENV JENKINS_HOME /home/jenkins

# Install utils
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    curl \
    perl \
    openssl \
    gnupg \
    unzip \
    make \
    wget \
    zip \
    bzip2 \
    vim \
    jq \
    yq \
    gcc \
    g++ \
    libcurl4-openssl-dev \
    build-essential \
    autoconf \
    libexpat1-dev \
    gettext \
    libssl-dev \
    libperl-dev \
    zlib1g-dev \
    python3 \
    python3-pip \
    podman \
    tini \
    fuse-overlayfs \
    software-properties-common \
    apt-transport-https \
    openjdk-21-jdk

# for podman
COPY storage.conf /etc/containers/storage.conf
COPY containers.conf /etc/containers/containers.conf
COPY registries.conf /etc/containers/registries.conf
VOLUME /var/lib/containers

## Settings for Java
ENV JDK_HOME=/usr/lib/jvm/java-21-openjdk-${TARGETARCH}
ENV JAVA_HOME=$JDK_HOME
ENV PATH=$PATH:${JAVA_HOME}/bin

# Settings for python
RUN ln -fs $(which python3) /usr/bin/python && ln -fs $(which pip3) /usr/bin/pip

# Install docker CLI
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-buildx-plugin docker-compose-plugin

# Install helm
RUN apt-get install curl gpg apt-transport-https --yes && \
    curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && \
    apt-get install -y helm

# Install kubectl
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

# Install kustomize
RUN cd /usr/local/bin && curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

# Install ks (Kubesphere CLI)
RUN curl -fL https://github.com/kubesphere-sigs/ks/releases/download/v0.0.73/ks-linux-$(dpkg --print-architecture).tar.gz | tar xzv && \
    mv ks /usr/local/bin/

# Set up NodeSource repository for Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -

# Install Node.js
RUN apt-get install -y nodejs

# Install Yarn and other packages
RUN npm install --global --force corepack@latest npm@10.9.3 yarn watch-cli typescript

# enable corepack
RUN corepack enable pnpm

# Install pnpm
RUN corepack use pnpm@10.17.1

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set working directory
WORKDIR /home/jenkins

# Default command
ENTRYPOINT ["/usr/bin/tini", "--"]
