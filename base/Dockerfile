FROM ubuntu:22.04

# utils
RUN apt-get update && \
    apt-get install -y ca-certificates \
    gcc build-essential make autoconf cmake \
    zip bzip2 unzip \
    curl wget vim \
    libexpat1 libexpat1-dev gettext jq \
    libcurl4-openssl-dev openssl \
    perl \
    zlib1g-dev \
    openjdk-17-jdk && \
    apt-get clean autoclean

ENV GIT_VERSION 2.46.0
RUN wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz && \
    tar zxvf git-${GIT_VERSION}.tar.gz --no-same-owner && \
    cd git-${GIT_VERSION} && \
    make configure && \
    ./configure prefix=/usr/local/git/ && \
    make && \
    make install && \
    ln -s /usr/local/git/bin/git /usr/bin/git && \
    cd ..&& \
    rm -rf git-${GIT_VERSION}.tar.gz git-${GIT_VERSION} && \
    git version

# Set the locale(en_US.UTF-8)
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV PATH $PATH:/usr/local/bin

# USER jenkins
WORKDIR /home/jenkins

# install sonarqube
ENV SONAR_SCANNER_VERSION 4.6.0.2311
RUN curl -o sonar_scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip && \
    unzip sonar_scanner.zip && rm sonar_scanner.zip && \
    rm -rf sonar-scanner-$SONAR_SCANNER_VERSION-linux/jre && \
    sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /home/jenkins/sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin/sonar-scanner && \
    mv /home/jenkins/sonar-scanner-$SONAR_SCANNER_VERSION-linux /usr/local/lib && \
    ln -s /usr/local/lib/sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin/sonar-scanner /usr/local/bin/sonar-scanner && \
    ln -s /usr/local/lib/sonar-scanner-$SONAR_SCANNER_VERSION-linux/bin/sonar-scanner-debug /usr/local/bin/sonar-scanner-debug

COPY ./ ./
RUN ./hack/install_utils.sh && rm -rf ./*

CMD ["docker","version"]
