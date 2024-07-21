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

FROM alpine:latest

ENV REDIS_PORT=6379

RUN apk update && apk upgrade
RUN apk add redis

#COPY redis.conf /etc/redis.conf

EXPOSE $REDIS_PORT

CMD ["redis-server", "--protected-mode", "no"]