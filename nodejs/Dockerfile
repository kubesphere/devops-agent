FROM kubespheredev/builder-base:v4.1.0

ENV NODE_VERSION v16.20.2

RUN curl -fsSL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install nodejs -y && \
    node -v && npm -v

RUN npm install -g yarn && \
    yarn config set cache-folder /root/.yarn
