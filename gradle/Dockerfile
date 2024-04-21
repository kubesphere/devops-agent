FROM kubespheredev/builder-base:v3.3.2

# java
ENV JAVA_VERSIOIN 1.8.0
RUN yum install -y java-${JAVA_VERSIOIN}-openjdk-devel java-${JAVA_VERSIOIN}-openjdk-devel.i686 && \
    yum -y clean all

# gradle6
ENV GRADLE_VERSION 6.9.1
ENV GRADLE_HOME /usr/local/gradle-${GRADLE_VERSION}
ENV PATH ${GRADLE_HOME}/bin:$PATH

RUN curl -fSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip && \
    echo "$(curl -sLf https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip.sha256) gradle.zip" | sha256sum --check && \
    unzip -q gradle.zip -d /usr/local && \
    rm -f gradle.zip

# Set JDK to be 32bit
COPY set_java $GRADLE_HOME
RUN $GRADLE_HOME/set_java && \
    rm -f $GRADLE_HOME/set_java

CMD ["gradle","--version"]
