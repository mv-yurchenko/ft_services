# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: atable <atable@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/16 21:26:52 by atable            #+#    #+#              #
#    Updated: 2020/11/20 20:36:14 by atable           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

EXPOSE 22 80 443

RUN apk update
RUN apk upgrade
RUN apk add openssl openssh nginx bash supervisor sudo

COPY srcs/* ./srcs/

RUN adduser -D admin
RUN echo 'admin:admin' | chpasswd
RUN addgroup admin wheel
RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel

RUN /usr/bin/ssh-keygen -A

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=School 42/OU=21/CN=Atable"
    
RUN rm -rf /etc/nginx/conf.d/default.conf
RUN cp /srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN cp /srcs/index.html /var/www

RUN chown -R root:root /var/www/*

#RUN find /var/www/ -type d -exec chmod 755 {} \;
#RUN find /var/www/ -type f -exec chmod 644 {} \;

RUN mkdir /run/nginx
RUN mkdir /run/sshd

CMD bash /srcs/start.sh