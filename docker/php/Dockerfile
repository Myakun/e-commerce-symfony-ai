FROM php:8.5-fpm

RUN set -eux \
	&& DEBIAN_FRONTEND=noninteractive apt-get update -qq \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -qq -y --no-install-recommends --no-install-suggests \
		ca-certificates \
		git \
		libicu-dev \
		libpq-dev \
		libzip-dev \
		unzip \
		zip \
		zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN set -eux \
	&& docker-php-ext-install -j$(getconf _NPROCESSORS_ONLN) intl pdo_pgsql zip

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ADD composer/auth.json /root/.composer/auth.json

RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini
ADD php.ini /usr/local/etc/php/conf.d/zzz-custom.ini

WORKDIR /var/www/app

CMD ["php-fpm"]
