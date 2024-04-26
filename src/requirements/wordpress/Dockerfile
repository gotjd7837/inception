FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -y install wget vim php-fpm php-mysql sendmail mariadb-client

COPY ./tools/wordpress.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]
CMD ["php-fpm7.4", "-F"]