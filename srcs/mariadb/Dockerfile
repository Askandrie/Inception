# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/19 23:21:21 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/20 18:40:52 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

ENV WORDPRESS_DB_HOST=db_host
ENV WORDPRESS_DB_USER=db_user
ENV WORDPRESS_DB_PASSWORD=db_password
ENV WORDPRESS_DB_NAME=wordpress

RUN apk update && apk upgrade
RUN apk add --no-cache mariadb mariadb-client
# RUN mkdir -p /run/mysqld /var/lib/mysql
# RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["/usr/bin/mariadbd", "--user=root", "--datadir=/var/lib/mysql"]