FROM kubespheredev/builder-base:v3.1.0

# java
ARG JAVA_VERSIOIN 17.0.1
SHELL ["/bin/bash", "-c"]
ENV BASH_ENV ~/.bashrc
ENV JAVA_HOME /usr/local/jdk-${JAVA_VERSIOIN}
ENV PATH ${JAVA_HOME}/bin:$PATH

RUN \
  # Install JDK
  if [ "$JAVA_VERSIOIN" == "1.8.0" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/openjdk/jdk8u41/ri/openjdk-8u41-b04-linux-x64-14_jan_2020.tar.gz -o openjdk.tar.gz \
    && mkdir -pv /usr/local/jdk-1.8.0 && tar -zxvf openjdk.tar.gz -C /usr/local/jdk-1.8.0 --strip-components 1 \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "11" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \   
  elif [ "$JAVA_VERSIOIN" == "11.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \ 
  elif [ "$JAVA_VERSIOIN" == "11.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \          
  elif [ "$JAVA_VERSIOIN" == "12" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk12/33/GPL/openjdk-12_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk12/33/GPL/openjdk-12_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "12.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "12.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk12.0.2/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-12.0.2_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk12.0.2/e482c34c86bd4bf8b56c0b35558996b9/10/GPL/openjdk-12.0.2_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \  
  elif [ "$JAVA_VERSIOIN" == "13" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk13/5b8a42f3905b406298b72d750b6919f6/33/GPL/openjdk-13_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk13/5b8a42f3905b406298b72d750b6919f6/33/GPL/openjdk-13_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "13.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "13.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \          
  elif [ "$JAVA_VERSIOIN" == "14" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk14/076bab302c7b4508975440c56f6cc26a/36/GPL/openjdk-14_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk14/076bab302c7b4508975440c56f6cc26a/36/GPL/openjdk-14_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "14.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "14.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk14.0.2/205943a0976c4ed48cb16f1043c5c647/12/GPL/openjdk-14.0.2_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \     
  elif [ "$JAVA_VERSIOIN" == "15" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk15/779bf45e88a44cbd9ea6621d33e33db1/36/GPL/openjdk-15_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk15/779bf45e88a44cbd9ea6621d33e33db1/36/GPL/openjdk-15_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "15.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "15.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \    
  elif [ "$JAVA_VERSIOIN" == "16" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/7863447f0ab643c585b9bdebf67c69db/36/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \    
  elif [ "$JAVA_VERSIOIN" == "16.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk16.0.1/7147401fd7354114ac51ef3e1328291f/9/GPL/openjdk-16.0.1_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \  
  elif [ "$JAVA_VERSIOIN" == "16.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl https://download.java.net/java/GA/jdk16.0.2/d4a915d82b4c4fbb9bde534da945d746/7/GPL/openjdk-16.0.2_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \                 
  elif [ "$JAVA_VERSIOIN" == "17" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl -sLf https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \    
  elif [ "$JAVA_VERSIOIN" == "17.0.1" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl -sLf https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/2a2082e5a09d4267845be086888add4f/12/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  elif [ "$JAVA_VERSIOIN" == "17.0.2" ]; \
  then \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl -sLf https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \    
  else \
    yum -y remove java-1.8.0-openjdk \
    && curl -fSL https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz -o openjdk.tar.gz \
    && echo "$(curl -sLf https://download.java.net/java/GA/jdk${JAVA_VERSIOIN}/dfd4a8d0985749f896bed50d7138ee7f/8/GPL/openjdk-${JAVA_VERSIOIN}_linux-x64_bin.tar.gz.sha256) openjdk.tar.gz" | sha256sum --check  \
    && tar -zxvf openjdk.tar.gz -C /usr/local \
    && rm -f openjdk.tar.gz \
    && echo "export JAVA_HOME=/usr/local/jdk-${JAVA_VERSIOIN}" >> ~/.bashrc \
    && echo "export PATH=\"/usr/local/jdk-${JAVA_VERSIOIN}/bin:$PATH\"" >> ~/.bashrc \
    && echo "export JAVA_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc ; \
  fi \
  # Test install
    && ls -l /usr/local/ \
    && javac -version

# gradle
ARG GRADLE_VERSION 7.4.2
ENV GRADLE_HOME /usr/local/gradle-${GRADLE_VERSION}
ENV PATH ${GRADLE_HOME}/bin:$PATH

RUN curl -fSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip  \
    && echo "$(curl -sLf https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip.sha256) gradle.zip" | sha256sum --check  \
    && unzip -q gradle.zip -d /usr/local  \
    && rm -f gradle.zip  \
    && echo "export GRADLE_HOME=/usr/local/gradle-${GRADLE_VERSION}" >> ~/.bashrc  \
    && echo "export PATH=\"/usr/local/gradle-${GRADLE_VERSION}/bin:$PATH\"" >> ~/.bashrc  \
    && echo "export GRADLE_HOME PATH " >> ~/.bashrc  \
    && cat ~/.bashrc  \
    && source ~/.bashrc \
    && ls -l /usr/local/ \
    && gradle -v

# Set JDK to be 32bit
# COPY set_java $GRADLE_HOME
# RUN $GRADLE_HOME/set_java && \
#     rm -f $GRADLE_HOME/set_java

CMD ["gradle","--version"]
