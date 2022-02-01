FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html

ADD ./docker/nginx/default.prod.conf /etc/nginx/conf.d/default.conf
ADD ./docker/nginx/laravel-docker.test.pem /etc/nginx/certs/laravel-docker.test.pem
ADD ./docker/nginx/laravel-docker.test-key.pem /etc/nginx/certs/laravel-docker.test-key.pem

RUN sed -i "s/user www-data/user laravel/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}