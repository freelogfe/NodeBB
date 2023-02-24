FROM node:lts

RUN mkdir -p /usr/src/app && \
    chown -R node:node /usr/src/app
WORKDIR /usr/src/app

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

COPY --chown=node:node install/package.json /usr/src/app/package.json
COPY --chown=node:node install/config.prod.json /usr/src/app/config.json

USER node

RUN npm config set registry http://registry.npmmirror.com
RUN npm install -omit=dev && \
    npm cache clean --force

COPY --chown=node:node . /usr/src/app

ENV NODE_ENV=prod \
    daemon=false \
    silent=false

EXPOSE 4567

CMD test -n "${SETUP}" && ./nodebb setup || node ./nodebb build; node ./nodebb start
