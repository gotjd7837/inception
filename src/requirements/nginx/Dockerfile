FROM debian:bullseye

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install nginx openssl vim && \
    mkdir -p /etc/nginx/snippets/ /var/run/nginx/ /var/www/html/wordpress && \
    chmod 755 -R /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/nginx.sh /usr/local/bin/

CMD ["/usr/local/bin/nginx.sh"]