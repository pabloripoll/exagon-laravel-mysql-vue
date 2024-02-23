ARG ALPINE_VERSION=3.19
ARG PHP_VERSION=8.3
ARG PHP_ALPINE=83

FROM alpine:${ALPINE_VERSION}
FROM php:${PHP_VERSION}-fpm-alpine

<<<<<<< Updated upstream
# Setup unique user and group - needs bash
RUN apk add --no-cache bash

ARG UID
ARG GID
ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system docker
RUN adduser -G docker --system -D -s /bin/sh -u ${UID} docker

# Create project root
=======
# User & Group
ARG UID
ARG GID
ARG UNAME=${UNAME='devel'}
ARG GNAME=${GNAME='www-data'}

ENV UID=${UID}
ENV GID=${GID}

RUN usermod  --uid $UID $UNAME
RUN groupmod --gid $GID $GNAME

#RUN addgroup -g ${GID} --system ${$GNAME} # already exists
RUN adduser -G ${$GNAME} --system -D -s /bin/sh -u ${UID} ${UNAME}

# Project
>>>>>>> Stashed changes
RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Install main packages and remove default server definition
RUN apk add --no-cache \
  curl \
  wget \
  nginx \
  supervisor

# Install PHP and its extensions packages and remove default server definition
ENV PHP_V="php83"

RUN apk add --no-cache \
  ${PHP_V} \
  ${PHP_V}-cli \
  ${PHP_V}-ctype \
  ${PHP_V}-curl \
  ${PHP_V}-dom \
  ${PHP_V}-fileinfo \
  ${PHP_V}-fpm \
  ${PHP_V}-gd \
  ${PHP_V}-intl \
  ${PHP_V}-mbstring \
  ${PHP_V}-opcache \
  ${PHP_V}-openssl \
  ${PHP_V}-phar \
  ${PHP_V}-session \
  ${PHP_V}-tokenizer \
  ${PHP_V}-soap \
  ${PHP_V}-xml \
  ${PHP_V}-xmlreader \
  ${PHP_V}-xmlwriter \
  ${PHP_V}-zip \
  # Database
  ${PHP_V}-pdo \
  ${PHP_V}-pdo_sqlite \
  ${PHP_V}-sqlite3 \
  ${PHP_V}-pdo_mysql \
  ${PHP_V}-mysqli \
  ${PHP_V}-pdo_pgsql \
  ${PHP_V}-pgsql \
  ${PHP_V}-mongodb \
  ${PHP_V}-redis

<<<<<<< Updated upstream
=======
#
# NGINX configuration
#

RUN sed -i "s/user  nginx/user www-data/g" /etc/nginx/nginx.conf

>>>>>>> Stashed changes
# Configure nginx - http
COPY config/nginx.conf /etc/nginx/nginx.conf

# Configure nginx - default server
COPY config/conf.d /etc/nginx/conf.d/

<<<<<<< Updated upstream
# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/${PHP_V}/php-fpm.d/www.conf
COPY config/php.ini /etc/${PHP_V}/conf.d/custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R docker.docker /var/www/html /run /var/lib/nginx /var/log/nginx

# PHP Docker
RUN docker-php-ext-install pdo pdo_mysql

# PHP Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
# ERROR file_put_contents(./composer.lock): Failed to open stream: Permission denied

# Create symlink for php
RUN ln -s /usr/bin/${PHP_V} /usr/bin/php

# Switch to use a non-root user from here on
USER docker

# Add application
COPY --chown=docker.docker ../ /var/www/html/
=======
# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#
# PHP configuration
#

# PHP Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# PHP extensions for Docker from image
RUN docker-php-ext-install pdo pdo_mysql

# PHP Redis
#RUN mkdir -p /usr/src/php/ext/redis \
#    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
#    && echo 'redis' >> /usr/src/php-available-exts \
#    && docker-php-ext-install redis

USER ${UNAME}

# Configure PHP-FPM
ENV PHP_INI_DIR /etc/php83
COPY config/fpm-pool.conf ${PHP_INI_DIR}/php-fpm.d/www.conf
COPY config/php.ini ${PHP_INI_DIR}/conf.d/custom.ini

# Add application
COPY ../ /var/www/html/
>>>>>>> Stashed changes

# Expose the port Nginx is reachable on
EXPOSE 80

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
