FROM kubesphere/builder-base:v3.1.0

# 切换国内源并安装依赖工具包
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
    && wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo \
    && yum -y install deltarpm && yum makecache && yum -y update && yum clean all \
    && yum -y install gcc curl openssl openssl-devel ca-certificates tar perl perl-Module-Load-Conditional && yum clean all

ARG VERSION=latest

ENV VOLTA_VERSION $VERSION

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
ENV PATH="/root/.cargo/bin:${PATH}"

SHELL ["/bin/bash", "-c"]
ENV BASH_ENV ~/.bashrc
ENV VOLTA_HOME /root/.volta
ENV PATH $VOLTA_HOME/bin:$PATH
RUN \
  # Install Volta
  if [ "$VERSION" = "latest" ]; \
  then \
  curl https://get.volta.sh | bash; \
  else \
  curl https://get.volta.sh | bash -s -- --version $VERSION; \
  fi \
  # Test install
  && ls -l ~/.volta/bin \
  && volta --version

