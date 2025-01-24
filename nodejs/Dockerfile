FROM kubespheredev/builder-base:v4.1.0

ENV NODE_VERSION v16.20.2

# install nodejs,if need node.js v20 replace url: https://deb.nodesource.com/setup_20.x
RUN curl -fsSL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh && \
    bash nodesource_setup.sh && \
    apt-get install nodejs -y && \
    node -v && npm -v

# install yarn
RUN npm install -g yarn && \
    yarn config set cache-folder /root/.yarn

# install pnpm
RUN npm install -g pnpm
