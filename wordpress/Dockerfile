# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atable <atable@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/18 16:05:28 by atable            #+#    #+#              #
#    Updated: 2020/11/21 20:29:39 by atable           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

EXPOSE 5050

RUN apk update
RUN apk upgrade
RUN apk add nginx bash
RUN apk add php7 php7-fpm php7-mysqli php7-json php7-session php7-fpm php7-phar php7-iconv php7-mbstring

COPY srcs/* ./srcs/

RUN wget http://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv /srcs/wp-config.php /wordpress
RUN mv /wordpress /var/www/
RUN chmod -R 777 /var/www/

RUN rm -rf /etc/nginx/conf.d/default.conf
RUN cp /srcs/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf

CMD bash /srcs/start.sh