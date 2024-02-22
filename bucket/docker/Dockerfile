ARG ALPINE_VERSION=3.19

FROM alpine:${ALPINE_VERSION}
FROM php:8.3-fpm-alpine

# Setup document root
WORKDIR /var/www/html

# Install packages and remove default server definition
RUN apk add --no-cache \
  curl \
  wget \
  nginx \
  supervisor \
  ## PHP extensions
  php83 \
  php83-cli \
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
  php83-sqlite3 \
  php83-mysqli \
  php83-pgsql \
  php83-mongodb \
  php83-redis

# Configure nginx - http
COPY config/nginx.conf /etc/nginx/nginx.conf

# Configure nginx - default server
COPY config/conf.d /etc/nginx/conf.d/

# Configure PHP-FPM
ENV PHP_INI_DIR /etc/php83
COPY config/fpm-pool.conf ${PHP_INI_DIR}/php-fpm.d/www.conf
COPY config/php.ini ${PHP_INI_DIR}/conf.d/custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/html /run /var/lib/nginx /var/log/nginx

# PHP Docker
RUN docker-php-ext-install pdo pdo_mysql

# PHP Composer
RUN wget https://getcomposer.org/installer -O composer-setup.php && \
  php83 composer-setup.php --quiet --install-dir=/usr/bin --filename=composer && \
  rm composer-setup.php

# Create symlink for php
RUN ln -s /usr/bin/php83 /usr/bin/php

# Switch to use a non-root user from here on
USER nobody

# Add application
COPY --chown=nobody ../ /var/www/html/

# Expose the port nginx is reachable on
EXPOSE 80

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
