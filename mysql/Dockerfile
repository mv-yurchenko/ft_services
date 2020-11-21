# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atable <atable@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/20 18:36:49 by atable            #+#    #+#              #
#    Updated: 2020/11/21 17:10:11 by atable           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

EXPOSE 3306

VOLUME /var/lib/mysql

RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add mariadb mariadb-client openrc

COPY srcs/* ./srcs/

CMD bash /srcs/start.sh