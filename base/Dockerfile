FROM kubespheredev/builder-base:v3.3.1

WORKDIR /home/jenkins

COPY ./ ./
RUN ./hack/install_utils.sh && rm -rf ./*

CMD ["docker","version"]
