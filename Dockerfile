FROM php:7.3-fpm-alpine
RUN apk add --no-cache \
        bash \
        sed
# install the PHP extensions we need
RUN set -ex; \
    \
    apk add --no-cache --virtual .build-deps \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
    ; \
    \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install gd mysqli opcache zip; \
    \
    runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
            | tr ',' '\n' \
            | sort -u \
            | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )"; \
    apk add --virtual .wordpress-phpexts-rundeps $runDeps; \
    apk del .build-deps

RUN apk --update --no-cache add autoconf g++ make && \
    # pecl install -f xdebug-2.7.0beta1 && \
    pecl install -f redis && \
    #docker-php-ext-enable xdebug && \
    docker-php-ext-enable redis && \
    apk del --purge autoconf g++ make
