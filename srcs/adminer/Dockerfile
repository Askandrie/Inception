# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/21 06:09:47 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/21 06:21:24 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add php83 php83-fpm php83-mysqli php83-json php83-session curl
RUN mkdir -p /opt/adminer
RUN curl -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /opt/adminer