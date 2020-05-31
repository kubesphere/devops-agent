FROM kubespheredev/builder-base:latest

RUN yum -y groupinstall 'Development Tools'  && yum -y clean all --enablerepo='*'

ENV GOLANG_VERSION 1.12.10

ENV PATH $PATH:/usr/local/go/bin
ENV PATH $PATH:/usr/local/
ENV GOROOT /usr/local/go
ENV GOPATH=/home/jenkins/go
ENV PATH $PATH:$GOPATH/bin

COPY ./ ./
RUN ./hack/install_utils.sh && rm -rf ./*

RUN mkdir -p $GOPATH/bin && mkdir -p $GOPATH/src && mkdir -p $GOPATH/pkg

CMD ["go","version"]
