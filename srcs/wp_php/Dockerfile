# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/19 23:36:49 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/21 06:15:19 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3

RUN addgroup -g 101 nginx && adduser -D -u 100 -G nginx nginx \
    && apk update && apk upgrade \
    && apk add --no-cache \
    php83 \
    php83-common \
    php83-phar \
    php83-cli \
    php83-mbstring \
    php83-bz2 \
    php83-fpm \
    php83-mysqli \
    php83-json \
    php83-session \
    php83-opcache \
    php83-curl \
    php83-redis \
    php83-openssl \
    php83-dom \
    php83-ctype \
    php83-tokenizer \
    php83-exif \
    php83-gd \
    php83-fileinfo \
    php83-pecl-imagick \
    php83-intl \
    php83-iconv \
    php83-zip \
    php83-xml \
    php83-simplexml \
    php83-xmlreader \
    php83-xmlwriter \
    php83-dom \
    mariadb-client \
    && sed -i 's|listen = .*|listen = 0.0.0.0:9000|' /etc/php83/php-fpm.d/www.conf \
    && sed -i 's|^;error_log = log/php-fpm.log|error_log = /proc/self/fd/2|' /etc/php83/php-fpm.conf \
    && wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
    && rm -rf /tmp/* /var/tmp/* /usr/share/man/* /usr/share/doc/*

COPY 99-custom.ini /etc/php83/conf.d/
COPY entrypoint.sh /

EXPOSE 9000

ENTRYPOINT ["sh", "entrypoint.sh"]