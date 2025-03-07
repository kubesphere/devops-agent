FROM ubuntu:24.04

# Set working directory
WORKDIR /root

# Set PATH
ENV PATH=$PATH:/usr/local:/usr/local/bin

# Set Bash as the default shell
RUN chsh -s /bin/bash
SHELL ["/bin/bash", "-c"]

# Create a script file sourced by both interactive and non-interactive bash shells
ENV BASH_ENV=/root/.bash_env
RUN touch "${BASH_ENV}"
RUN echo '. "${BASH_ENV}"' >> /root/.bashrc

# Install utils
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
    python3 \
    python3-pip \
    podman \
    software-properties-common \
    openjdk-21-jdk

## Settings for Java
ENV JDK_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
ENV JAVA_HOME=$JDK_HOME

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

# Install Sonar Scanner CLI
ENV SONAR_SCANNER_VERSION=7.0.2.4839
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
    ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-${TARGET_ARCH}/bin/sonar-scanner /usr/local/bin/sonar-scanner

# Install ks (Kubesphere CLI)
RUN curl -fL https://github.com/kubesphere-sigs/ks/releases/download/v0.0.73/ks-linux-$(dpkg --print-architecture).tar.gz | tar xzv && \
    mv ks /usr/local/bin/

# Install golang
RUN add-apt-repository ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get install -y golang-go

# Settings for golang
ENV GOROOT=$(go env GOROOT)
ENV GOPATH=$(go env GOPATH)
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
RUN mkdir -p $GOPATH/bin && mkdir -p $GOPATH/src && mkdir -p $GOPATH/pkg

# Install sdkman
RUN curl -s "https://get.sdkman.io" | bash

# Install gradle
ENV GRADLE_VERSION=8.13
RUN source "/root/.sdkman/bin/sdkman-init.sh" && \
    sdk install gradle ${GRADLE_VERSION}

# Install Maven
ENV MAVEN_VERSION=3.9.9
RUN curl -f -L https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar -C /opt -xzv
ENV M2_HOME=/opt/apache-maven-$MAVEN_VERSION
ENV maven.home=$M2_HOME
ENV M2=$M2_HOME/bin
ENV PATH=$PATH:$M2:${JAVA_HOME}/bin

# Install ant
ENV ANT_VERSION=1.10.15
RUN wget -q https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME=/opt/ant
ENV PATH=${PATH}:${ANT_HOME}/bin

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | PROFILE="${BASH_ENV}" bash
RUN echo node > .nvmrc

# Download and install Node.js
RUN nvm install 22
RUN npm install --global watch-cli vsce typescript

# Install Yarn
RUN npm install --global yarn

# Install .NET
RUN add-apt-repository ppa:dotnet/backports && \
    apt-get update && \
    apt-get install -y dotnet-sdk-9.0

ENV PATH=$PATH:/root/.nuget/tools:/root/.dotnet/tools

# Settings for podman
RUN mkdir -p /etc/containers
COPY *.conf /etc/containers/
VOLUME /var/lib/containers

# Verify installations
RUN docker --version && \
    podman --version && \
    java --version && \
    helm version && \
    kubectl version --client && \
    ks version && \
    sonar-scanner --version && \
    dotnet --version && \
    go version && \
    gradle --version && \
    mvn --version && \
    ant --version && \
    nvm --version && \
    nvm current && \
    npm --version && \
    node --version && \
    yarn --version && \
    python --version && \
    pip --version && \
    kustomize version

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /home/jenkins

# Default command
CMD ["docker", "version"]
