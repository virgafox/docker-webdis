# BUILD IMAGE
FROM alpine:3.11.3 AS stage
ENV WEBDIS_VERSION 0.1.9
RUN apk update && apk add wget make gcc libevent-dev msgpack-c-dev musl-dev bsd-compat-headers
RUN wget https://github.com/nicolasff/webdis/archive/$WEBDIS_VERSION.tar.gz -O webdis.tar.gz
RUN tar -xvzf webdis.tar.gz
RUN cd webdis && make && make install

# RUN IMAGE
FROM alpine:3.11.3
RUN apk update && apk add libevent
COPY --from=stage /usr/local/bin/webdis /usr/local/bin/
COPY entrypoint.sh /entrypoint.sh
EXPOSE 7379
ENTRYPOINT ["/entrypoint.sh"]