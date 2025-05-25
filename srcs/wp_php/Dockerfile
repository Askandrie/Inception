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
RUN apk add php83 php83-common php83-phar php83-cli php83-mbstring php83-bz2 php83-fpm php83-mysqli php83-json php83-session php83-curl php83-redis php83-openssl php83-dom php83-ctype php83-xmlwriter php83-tokenizer mariadb-client
RUN sed -i 's|listen = .*|listen = 0.0.0.0:9000|' /etc/php83/php-fpm.d/www.conf

RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN echo "memory_limit = 512M" > /etc/php83/conf.d/99-memory-limit.ini
COPY entrypoint.sh /

EXPOSE 9000

ENTRYPOINT [ "sh", "entrypoint.sh" ]