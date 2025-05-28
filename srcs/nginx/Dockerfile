# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/19 21:00:28 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/20 16:21:01 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3

RUN apk update && apk upgrade && apk add --no-cache nginx openssl && \
    mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/selfsigned.key \
    -out /etc/nginx/ssl/selfsigned.crt \
    -subj "/C=FR/ST=Angouleme/L=Angouleme/O=FairladyLab/OU=Inception/CN=localhost"

COPY nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /tmp/* /var/tmp/* /usr/share/man/* /usr/share/doc/*

CMD ["nginx", "-g", "daemon off;"]