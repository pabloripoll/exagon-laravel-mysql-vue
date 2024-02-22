ARG ALPINE_VERSION=3.19

FROM alpine:${ALPINE_VERSION}
FROM php:8.3-fpm-alpine

# Primary settings
ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

#RUN addgroup -g ${GID} --system www-data
RUN adduser -G www-data --system -D -s /bin/sh -u ${UID} devel

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

# Install packages and remove default server definition
RUN apk add --no-cache \
  curl \
  wget \
  nano \
  nginx \
  supervisor \
  ## PHP extensions
  php83 \
  php83-cli \
  php83-common \
  php83-ctype \
  php83-curl \
  php83-dom \
  php83-fileinfo \
  php83-fpm \
  php83-gd \
  php83-intl \
  php83-mbstring \
  php83-opcache \
  php83-openssl \
  php83-phar \
  php83-session \
  php83-tokenizer \
  php83-soap \
  php83-xml \
  php83-xmlreader \
  php83-xmlwriter \
  php83-zip \
  # Database
  php83-pdo \
  php83-sqlite3 \
  php83-mysqli \
  php83-pgsql \
  php83-mongodb \
  php83-redis

# NGINX configuration

RUN sed -i "s/user  nginx/user www-data/g" /etc/nginx/nginx.conf

## Configure nginx - http
COPY config/nginx.conf /etc/nginx/nginx.conf

## Configure nginx - default server
COPY config/conf.d /etc/nginx/conf.d/

## Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# PHP configuration

## PHP Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

#RUN sed -i "s/user = www-data/user = www-data/g" /usr/local/etc/php-fpm.d/www.conf
#RUN sed -i "s/group = www-data/group = www-data/g" /usr/local/etc/php-fpm.d/www.conf
#RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

RUN docker-php-ext-install pdo pdo_mysql

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

USER devel

#CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]

# PHP Composer
#RUN wget https://getcomposer.org/installer -O composer-setup.php && \
#  php83 composer-setup.php --quiet --install-dir=/usr/bin --filename=composer && \
#  rm composer-setup.php
# make composer writable

# Configure PHP-FPM
ENV PHP_INI_DIR /etc/php83
COPY config/fpm-pool.conf ${PHP_INI_DIR}/php-fpm.d/www.conf
COPY config/php.ini ${PHP_INI_DIR}/conf.d/custom.ini

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
#RUN chown -R nobody.nobody /var/www/html /run /var/lib/nginx /var/log/nginx

# Create symlink for php
#RUN ln -s /usr/bin/php83 /usr/bin/php

# Add application
#COPY --chown=nobody ../ /var/www/html/
COPY ../ /var/www/html/

# Expose the port nginx is reachable on
EXPOSE 80

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
