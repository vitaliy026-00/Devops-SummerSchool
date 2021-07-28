FROM alpine:latest

RUN apk update && apk add apache2 && \
    apk add openrc --no-cache && rc-status --manual && \
    touch /run/openrc/softlevel && rc-service apache2 start 

COPY ./index.html /var/www/localhost/htdocs/index.html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
