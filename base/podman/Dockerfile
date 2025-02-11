FROM kubesphere/builder-base:v3.2.2-podman

WORKDIR /home/jenkins

COPY ./ ./
RUN ./hack/install_utils.sh && rm -rf ./*

VOLUME /var/lib/containers

CMD ["podman", "info"]
