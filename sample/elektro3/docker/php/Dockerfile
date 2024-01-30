FROM php:7.3-fpm-stretch

ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    userdel -f www-data &&\
    if getent group www-data ; then groupdel www-data; fi &&\
    groupadd -g ${GROUP_ID} www-data &&\
    useradd -l -u ${USER_ID} -g www-data -d /home/www-data -s /usr/sbin/nologin www-data &&\
    install -d -m 0755 -o www-data -g www-data /home/www-data &&\
    chown --changes --silent --no-dereference --recursive --from=33:33 ${USER_ID}:${GROUP_ID} /var/www \
    ;fi

RUN apt-get update && apt-get install -y \
		build-essential \
		acl \
		file \
		gettext \
		git \
		unzip \
		libfreetype6 \
        libpng-tools \
        libjpeg62-turbo \
		libpng-dev \
		libfreetype6-dev \
		libjpeg-dev \
        libjpeg62-turbo-dev \
		wget \
		fontconfig \
		libxrender1 \
		xfonts-75dpi \
		xfonts-base \
		librabbitmq-dev


RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb; \
	dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

RUN set -eux; \
	apt-get update && apt-get install -y \
		$PHPIZE_DEPS \
		libicu-dev \
		g++ \
		zlib1g-dev \
		libzip-dev \
	; \
	\
	docker-php-ext-configure zip --with-libzip; \
	docker-php-ext-configure gd \
        --with-freetype-dir=/usr/lib/ \
        --with-png-dir=/usr/lib/ \
        --with-jpeg-dir=/usr/lib/ \
        --with-gd \
	; \
	\
	docker-php-ext-install -j$(nproc) \
		intl \
		zip \
		mbstring \
		mysqli \
		pdo \
		pdo_mysql \
		gd \
		bcmath \
		sockets \
	; \
	pecl install \
		apcu-5.1.12 \
		amqp \
	; \
	pecl clear-cache; \
	docker-php-ext-enable \
		apcu \
		opcache \
		amqp \
	; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apt-get update && apt-get install -y $runDeps

RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

RUN printf '[PHP]\ndate.timezone = "Europe/Madrid"\n' > /usr/local/etc/php/conf.d/tzone.ini

COPY ./conf.d/app-php.ini $PHP_INI_DIR/conf.d/

USER www-data

WORKDIR /var/www
