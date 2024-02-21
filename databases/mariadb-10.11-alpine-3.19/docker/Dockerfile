ARG ALPINE_VERSION=3.19

FROM alpine:${ALPINE_VERSION}

RUN apk add openrc

# MariaDB version for Alpine 3.19
ENV MYSQL_VERSION=10.11.6-r0

RUN apk add --no-cache mysql=${MYSQL_VERSION} mysql-client=${MYSQL_VERSION} mariadb-server-utils=${MYSQL_VERSION} && \
	addgroup mysql mysql && \
	mkdir /scripts && \
	rm -rf /var/cache/apk/*

COPY ./startup.sh /scripts/startup.sh

RUN chmod +x /scripts/startup.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/scripts/startup.sh"]
