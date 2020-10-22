FROM nginx:stable

ADD vhost.conf /etc/nginx/conf.d/default.conf

RUN apt update && apt -y upgrade