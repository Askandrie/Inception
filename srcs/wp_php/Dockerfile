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
RUN apk add php83 php83-common php83-cli php83-mbstring php83-bz2 php83-fpm php83-mysqli php83-json php83-session curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp --info

CMD ["php-fpm83", "-F"]