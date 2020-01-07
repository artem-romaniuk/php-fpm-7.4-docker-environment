FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx vim nano

RUN rm /etc/nginx/sites-enabled/default

WORKDIR /var/www

EXPOSE 80
EXPOSE 443

CMD ["nginx"]
