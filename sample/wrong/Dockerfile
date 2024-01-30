ARG PHP_VERSION=82
ARG NGINX_VERSION=1.24.0
ARG ALPINE_VERSION=3.19.0

FROM alpine:${ALPINE_VERSION}

FROM nginx:${NGINX_VERSION}-alpine

# ALPINE CONFIG
RUN echo 'Configuring Alpine v'.${ALPINE_VERSION}

RUN apk --no-cache add openrc bash curl git helm openssh yq github-cli \
    # Remove alpine cache
    && rm -rf /var/cache/apk/*

# NGINX CONFIG
RUN echo 'Configuring NGINX v'.${NGINX_VERSION}

COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

# NGINX CONFIG
RUN echo 'Configuring NGINX v'.${NGINX_VERSION}

RUN apk --no-cache add \
    php${PHP_VERSION} \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-pecl-apcu \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-pgsql \
    php${PHP_VERSION}-sqlite3 \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-mongodb \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-rpc \
    php${PHP_VERSION}-simplexml \
    php${PHP_VERSION}-xmlreader \
    php${PHP_VERSION}-soap \
    php${PHP_VERSION}-dev \
    php${PHP_VERSION}-imap \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-zlib \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-phar \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-bz2 \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-ctype \
    php${PHP_VERSION}-session \
    php${PHP_VERSION}-iconv \
    php${PHP_VERSION}-tokenizer \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-imagick \
    -y \
    # Remove alpine cache
    && rm -rf /var/cache/apk/* \
    # Remove default server definition
    && rm /etc/nginx/http.d/default.conf \
    # Make sure files/folders needed by the processes are accessable when they run under the nobody user
    && chown -R nobody.nobody /run \
    && chown -R nobody.nobody /var/lib/nginx \
    && chown -R nobody.nobody /var/log/nginx

# Add configuration files
COPY --chown=nobody etc/ /

# Switch to use a non-root user from here on
USER nobody

ENV client_max_body_size=2M \
    clear_env=no \
    allow_url_fopen=On \
    allow_url_include=Off \
    display_errors=Off \
    file_uploads=On \
    max_execution_time=0 \
    max_input_time=-1 \
    max_input_vars=1000 \
    memory_limit=128M \
    post_max_size=8M \
    upload_max_filesize=2M \
    zlib_output_compression=On

# Expose the port nginx is reachable on
EXPOSE 80 443

# Let runit start nginx & php-fpm
CMD [ "docker-entrypoint.sh" ]
