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
    software-properties-common \
    apt-transport-https \
    fuse-overlayfs \
    openjdk-21-jdk

# for podman
COPY storage.conf /etc/containers/storage.conf
COPY containers.conf /etc/containers/containers.conf
COPY registries.conf /etc/containers/registries.conf

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
    mv /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-${TARGET_ARCH} /opt/sonar-scanner && \
    ln -fs /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

# Install ks (Kubesphere CLI)
RUN curl -fL https://github.com/kubesphere-sigs/ks/releases/download/v0.0.73/ks-linux-$(dpkg --print-architecture).tar.gz | tar xzv && \
    mv ks /usr/local/bin/

# Install golang
ENV GOVERSION=1.24
ENV GOROOT=/usr/lib/go-${GOVERSION}
ENV GOPATH=$JENKINS_HOME/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
RUN mkdir -p $GOPATH/bin && mkdir -p $GOPATH/src && mkdir -p $GOPATH/pkg
RUN add-apt-repository -y ppa:longsleep/golang-backports && \
    apt-get update && \
    apt-get install -y golang-${GOVERSION}-go

RUN go env -w GOPATH=$JENKINS_HOME/go

# Install sdkman
RUN curl -s "https://get.sdkman.io" | bash

# Install gradle
ENV GRADLE_VERSION=8.14
RUN bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install gradle ${GRADLE_VERSION}"

RUN ln -fs /root/.sdkman/candidates/gradle/current/bin/gradle /usr/local/bin/gradle

# Install Maven
ENV MAVEN_VERSION=3.9.9
RUN curl -f -L https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz | tar -C /opt -xzv && \
    mv /opt/apache-maven-${MAVEN_VERSION} /opt/apache-maven
ENV M2_HOME=/opt/apache-maven
ENV maven.home=$M2_HOME
ENV M2=$M2_HOME/bin
ENV PATH=$PATH:$M2

# Install ant
ENV ANT_VERSION=1.10.15
RUN wget -q https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME=/opt/ant
ENV PATH=${PATH}:${ANT_HOME}/bin

# Set up NodeSource repository for Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -

# Install Node.js
RUN apt-get install -y nodejs

# Install Yarn and other packages
RUN npm install --global --force yarn watch-cli typescript

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set working directory
WORKDIR /home/jenkins

# Default command
ENTRYPOINT ["/bin/bash"]
