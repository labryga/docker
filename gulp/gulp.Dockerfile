FROM node:10.16.3-alpine as image_base


FROM image_base as image_user
RUN mkdir /node_modules /topos /staticfiles
WORKDIR /topos
COPY ./package.json .
COPY ./gulpfile.js .
RUN apk update && apk add --virtual --no-cache \
  shadow && adduser -D -H -g "" -u 5432 topos && \
  chown -R topos:topos $(pwd) /node_modules /staticfiles && \
  npm install -g gulp gulp-cli
RUN npm install && npm audit fix && npm cache clean --force && \
    cp -vR ./node_modules/* /node_modules && rm -R ./node_modules

ENV NODE_PATH=/node_modules


FROM image_user
WORKDIR /topos
USER topos
