FROM ubuntu:24.04

# Set the locale(en_US.UTF-8)
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH $PATH:/usr/local/bin

# Install additional utils not included by default
RUN apt-get update && \
    apt-get install -y \
    ca-certificates \
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
    python3-pip \
    podman \
    openjdk-21-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install docker CLI
RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-buildx-plugin docker-compose-plugin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm get_helm.sh

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/$(dpkg --print-architecture)/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Install kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

# Set up Sonar Scanner
ENV SONAR_SCANNER_VERSION 7.0.2.4839

# Install Sonar Scanner CLI
RUN arch=$(dpkg --print-architecture) && \
    if [ $arch = "amd64" ]; then \
      TARGET_ARCH=linux-x64; \
    elif [ $arch = "arm64" ]; then \
      TARGET_ARCH=linux-aarch64; \
    else \
      echo "Unsupported architecture: $arch" && exit 1; \
    fi && \
    wget -O sonar_scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-${TARGET_ARCH}.zip && \
    unzip sonar_scanner.zip -d /opt && \
    rm sonar_scanner.zip && \
    ln -s /opt/sonar-scanner-$SONAR_SCANNER_VERSION-${TARGET_ARCH}/bin/sonar-scanner /usr/local/bin/sonar-scanner

# Install ks (Kubesphere CLI)
RUN curl -fL https://github.com/kubesphere-sigs/ks/releases/download/v0.0.73/ks-linux-$(dpkg --print-architecture).tar.gz | tar xzv && \
    mv ks /usr/local/bin/


RUN mkdir -p /etc/containers
COPY *.conf /etc/containers/

VOLUME /var/lib/containers

# Set working directory
WORKDIR /home/jenkins

# Default command
CMD ["docker", "version"]
