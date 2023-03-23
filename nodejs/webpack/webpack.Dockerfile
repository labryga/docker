# FROM node:10.16.3-alpine as image_basE

FROM node:lts-alpine3.17
RUN apk update && apk add --virtual --no-cache \
  # inotify-tools 
  shadow && \
  adduser -D -g "" -u 5432 topos
  # chown -R topos:topos /home/topos/

USER topos
WORKDIR /home/topos
RUN npm install --save-dev webpack webpack-cli
