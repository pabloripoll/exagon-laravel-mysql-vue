# Alpine NGINX & PHP 8.2 FPM

## Docker Enviroment
Define `$PROJECT` and `$PROJECT_PORT` variables in an `./.env` file for `compose-compose.yaml` file
```yaml
version: "3.8"

services:
    nginx:
      image: php-8.2:nginx1.24
      build:
        context: . # directory Dockerfile resides
        dockerfile: Dockerfile
        args:
          USER_ID: ${USER_ID:-1000}
          GROUP_ID: ${GROUP_ID:-1000}
      container_name: ${PROJECT} # defined container name
      ports:
        - ${PROJECT_PORT}:80 # defined localhost port
      volumes:
        - type: bind
          source: ../ ## container will use the application running in the parent directory
          target: /var/www:cached ##
      tty: true

```

## Source
https://wiki.alpinelinux.org/wiki/Nginx_with_PHP#

https://github.com/docker-library/php

=> ERROR [ 7/11] RUN set -eux;  apk add --no-cache --virtual .build-deps   autoconf   dpkg-dev dpkg   file   g++   gcc   libc-dev   make   pkgconf   re2c   argon


https://github.com/docker-library/golang
https://pkg.go.dev/gitlab.alpinelinux.org/alpine/go#readme-apkbuild
https://stackoverflow.com/questions/52056387/how-to-install-go-in-alpine-linux
https://pkgs.alpinelinux.org/package/edge/testing/x86/mkcert