FROM node:10.16.3-alpine as main

FROM main as user

RUN mkdir /node_modules /topos

WORKDIR /topos

RUN apk update && apk add --virtual --no-cache \
  shadow && adduser -D -H -g "" -u 5432 topos && \
  chown -R topos:topos $(pwd) /node_modules && \
  npm install -g gulp gulp-cli && \
  npm cache clean --force && apk del shadow

USER topos
