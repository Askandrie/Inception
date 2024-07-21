# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/21 05:48:34 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/21 05:59:40 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update && apk add vsftpd
RUN echo 'local_enable=YES' >> etc/vsftpd.conf && \
    echo 'write_enable=YES' >> etc/vsftpd.conf && \
    echo 'dirmessage_enable=YES' >> etc/vsftpd.conf && \
    echo 'xferlog_enable=YES' >> etc/vsftpd.conf && \
    echo 'connect_from_port_20=YES' >> etc/vsftpd.conf && \
    echo 'listen=YES' >> etc/vsftpd.conf && \
    echo 'listen_port=21' >> etc/vsftpd.conf

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]