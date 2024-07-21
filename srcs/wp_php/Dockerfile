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
RUN apk add php83 php83-fpm php83-mysqli php83-json php83-session
RUN apk add unzip
RUN mkdir -p /www
RUN wget https://fr.wordpress.org/latest-fr_FR.zip
RUN unzip latest-fr_FR.zip
RUN rm latest-fr_FR.zip
RUN mv wordpress/* /www/

VOLUME /www

CMD ["php-fpm83", "-F"]