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

FROM alpine:latest

RUN addgroup -g 101 nginx && adduser -D -u 100 -G www-data www-data
RUN apk update && apk upgrade
RUN apk add php83 php83-common php83-phar php83-cli php83-mbstring php83-bz2 php83-fpm php83-mysqli php83-json php83-session php83-opcache php83-curl php83-redis php83-openssl php83-dom php83-ctype php83-xmlwriter php83-tokenizer mariadb-client
RUN sed -i 's|listen = .*|listen = 0.0.0.0:9000|' /etc/php83/php-fpm.d/www.conf
RUN sed -i 's|^;error_log = log/php-fpm.log|error_log = /proc/self/fd/2|' /etc/php83/php-fpm.conf

RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN echo "upload_max_filesize = 64M" > /etc/php83/conf.d/99-custom.ini
RUN echo "post_max_size = 64M" >> /etc/php83/conf.d/99-custom.ini
RUN echo "memory_limit = 256M" >> /etc/php83/conf.d/99-custom.ini
RUN echo "max_execution_time = 300" >> /etc/php83/conf.d/99-custom.ini
RUN echo "max_input_time = 300" >> /etc/php83/conf.d/99-custom.ini
RUN echo "expose_php = Off" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.enable = 1" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.memory_consumption=128" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.interned_strings_buffer=8" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.max_accelerated_files=4000" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.revalidate_freq=60" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.fast_shutdown=1" >> /etc/php83/conf.d/99-custom.ini
RUN echo "opcache.enable_cli=1" >> /etc/php83/conf.d/99-custom.ini

COPY entrypoint.sh /

EXPOSE 9000

ENTRYPOINT [ "sh", "entrypoint.sh" ]