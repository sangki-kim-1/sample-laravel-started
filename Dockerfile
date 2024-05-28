FROM alpine:3.20

RUN apk update && apk upgrade
RUN apk add curl
RUN apk add ca-certificates
RUN apk add bash
RUN apk add nginx


ARG PHP_VERSION=php83

RUN apk add --no-cache ${PHP_VERSION} \
    ${PHP_VERSION}-common \
    ${PHP_VERSION}-fpm \
    ${PHP_VERSION}-pdo \
    ${PHP_VERSION}-opcache \
    ${PHP_VERSION}-zip \
    ${PHP_VERSION}-phar \
    ${PHP_VERSION}-iconv \
    ${PHP_VERSION}-cli \
    ${PHP_VERSION}-curl \
    ${PHP_VERSION}-openssl \
    ${PHP_VERSION}-mbstring \
    ${PHP_VERSION}-tokenizer \
    ${PHP_VERSION}-fileinfo \
    ${PHP_VERSION}-json \
    ${PHP_VERSION}-xml \
    ${PHP_VERSION}-xmlwriter \
    ${PHP_VERSION}-simplexml \
    ${PHP_VERSION}-dom \
    ${PHP_VERSION}-pdo_mysql \
    ${PHP_VERSION}-pdo_sqlite \
    ${PHP_VERSION}-tokenizer \
    ${PHP_VERSION}-pecl-redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#STOPSIGNAL SIGTERM

COPY server/etc/nginx /etc/nginx
COPY server/etc/php /etc/php83

WORKDIR /usr/app
COPY . /usr/app

RUN composer install

RUN mkdir /var/run/php83

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/bin/bash", "-c", "php-fpm83 && chmod 777 /var/run/php83/php83-fpm.sock && chmod -R 777 /usr/app/* && nginx -g 'daemon off;'"]
