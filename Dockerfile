FROM alpine:latest

RUN apk update && apk add apache2

COPY ./index.html /var/www/localhost/htdocs/index.html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
