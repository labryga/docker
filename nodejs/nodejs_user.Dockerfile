FROM node:18.14.2-alpine3.17

ARG host_user_name
ARG host_user_id

ENV user_name=$host_user_name
ENV user_id=$host_user_id


RUN apk update && apk add --virtual --no-cache \
  shadow && \
  usermod -u 2000 node && groupmod -g 2000 node && \
  adduser -D -g "" -u "$user_id" "$user_name" && \
  apk del shadow

USER "$user_name"
WORKDIR /home/"$user_name"
