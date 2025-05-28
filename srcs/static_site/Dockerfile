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

RUN apk update && apk upgrade && apk add --no-cache nginx && \
    rm -rf /tmp/* /var/tmp/* /usr/share/man/* /usr/share/doc/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /opt
COPY style.css /opt

CMD ["nginx", "-g", "daemon off;"]