FROM nginx:1.27-alpine

RUN apk update && apk upgrade

WORKDIR /var/www/html

COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf