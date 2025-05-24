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

RUN apk update && apk upgrade
RUN apk add php83 php83-common php83-phar php83-cli php83-mbstring php83-bz2 php83-fpm php83-mysqli php83-json php83-session php83-curl php83-openssl php83-dom php83-xmlwriter php83-tokenizer

RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /wordpress

RUN echo "memory_limit = 512M" > /etc/php83/conf.d/99-memory-limit.ini
RUN wp core download --allow-root
RUN wp --info

EXPOSE 9000

CMD ["php-fpm83", "-F"]