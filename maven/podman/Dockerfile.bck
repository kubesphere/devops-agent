FROM kubespheredev/builder-base:v3.1.0-podman

ARG JDK_VERSION 1.8.0
ARG JDK_HOME /usr/lib/jvm/java-${JDK_VERSION}-openjdk

# java
ENV JAVA_VERSION $JDK_VERSION

RUN if [ "x${JAVA_VERSION}" = "x17" ]; then \
      ARCH= && uArch="$(uname -m)" \
        && case "${uArch##*-}" in \
          x86_64) ARCH='x64';; \
          aarch64) ARCH='aarch64';; \
          *) echo "unsupported architecture"; exit 1 ;; \
        esac \
      && wget https://download.oracle.com/java/${JAVA_VERSION}/latest/jdk-${JAVA_VERSION}_linux-${ARCH}_bin.rpm \
      && rpm -ivh jdk-${JAVA_VERSION}_linux-${ARCH}_bin.rpm; \
    else \
      yum install -y java-${JAVA_VERSION}-openjdk-devel java-${JAVA_VERSION}-openjdk-devel.i686; \
    fi
# maven
ENV MAVEN_VERSION 3.5.3
RUN curl -f -L https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar -C /opt -xzv
ENV M2_HOME /opt/apache-maven-$MAVEN_VERSION
ENV JAVA_HOME $JDK_HOME
ENV maven.home $M2_HOME
ENV M2 $M2_HOME/bin
ENV PATH $M2:$PATH:JAVA_HOME/bin

# ant
ENV ANT_VERSION 1.10.7
RUN cd && \
    wget -q https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

# Set JDK to be 32bit
COPY set_java $M2
RUN if [ "x${JAVA_VERSION}" = "x17" ]; then \
      rm $M2/set_java; \
    else \
      $M2/set_java && rm $M2/set_java; \
    fi

CMD ["mvn","-version"]
