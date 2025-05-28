# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/19 23:21:21 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/21 05:45:14 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3

ENV REDIS_PORT=6379

RUN apk update && apk upgrade \
    && apk add --no-cache redis \
    && rm -rf /tmp/* /var/tmp/* /usr/share/man/* /usr/share/doc/*

EXPOSE $REDIS_PORT

CMD ["redis-server", "--protected-mode", "no"]