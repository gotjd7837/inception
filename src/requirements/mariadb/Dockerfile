FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get install -y mariadb-server vim

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]
CMD ["mysqld_safe"]
