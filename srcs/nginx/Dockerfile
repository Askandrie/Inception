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

FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add nginx

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]