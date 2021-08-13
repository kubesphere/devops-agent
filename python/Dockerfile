FROM kubespheredev/builder-base:v3.1.0

# python3
ENV PYTHON_VERSION=3.7.11
RUN yum -y install bzip2-devel libffi-devel libsqlite3x-devel && \
    curl -fSL https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz -o /usr/src/Python-${PYTHON_VERSION}.tgz && \
    tar xzf /usr/src/Python-${PYTHON_VERSION}.tgz -C /usr/src/ --no-same-owner && \
    cd /usr/src/Python-${PYTHON_VERSION} && \
    ./configure --enable-optimizations --with-ensurepip=install --enable-loadable-sqlite-extensions && \
    make altinstall -j 2 && \
    cd ../ && \
    rm -rf /usr/src/Python-${PYTHON_VERSION}.tgz /usr/src/Python-${PYTHON_VERSION} && \
    ln -fs /usr/local/bin/python3.7 /usr/bin/python && \
    ln -fs /usr/local/bin/python3.7 /usr/bin/python3 && \
    ln -fs /usr/local/bin/pip3.7 /usr/bin/pip && \
    python3 -m pip install --upgrade pip && \
    python2 -m pip install --upgrade --force-reinstall pip && \
    sed -e 's|^#!/usr/bin/python|#!/usr/bin/python2.7|g' -i.bak /usr/bin/yum && \
    sed -e 's|^#! /usr/bin/python|#! /usr/bin/python2.7|g' -i.bak /usr/libexec/urlgrabber-ext-down && \
    yum -y remove bzip2-devel libffi-devel libsqlite3x-devel && \
    yum -y clean all

CMD ["python","--version"]
