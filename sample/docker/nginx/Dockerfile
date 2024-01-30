ARG NGINX_VERSION=1.24.0
ARG ALPINE_VERSION=3.19.0

FROM alpine:${ALPINE_VERSION}

FROM nginx:${NGINX_VERSION}-alpine

# ALPINE CONFIG
RUN echo 'Configuring Alpine v'.${ALPINE_VERSION}

RUN apk add bash git helm openssh yq github-cli

# NGINX CONFIG
RUN echo 'Configuring Nginx v'.${ALPINE_VERSION}

COPY ./conf.d/default.conf /etc/nginx/conf.d/default.conf

# PHP CONFIG