FROM kubespheredev/builder-base:v3.1.0

ENV KUSTOMIZE_VER 4.3.0

RUN cd && \
    curl -sLO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VER}/kustomize_v${KUSTOMIZE_VER}_linux_amd64.tar.gz && \
    tar xzf kustomize_v*.tar.gz && \
    mv kustomize /opt/kustomize && \
    ln -s /opt/kustomize /usr/local/bin/kustomize && \
    rm kustomize_v*.tar.gz

CMD ["kustomize","-version"]
