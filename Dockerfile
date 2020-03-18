# BUILD IMAGE
FROM alpine:3.11.3
ENV WEBDIS_VERSION 0.1.9
RUN apk update && apk add wget make gcc libevent-dev libevent msgpack-c-dev musl-dev bsd-compat-headers
RUN wget https://github.com/nicolasff/webdis/archive/$WEBDIS_VERSION.tar.gz -O webdis-$WEBDIS_VERSION.tar.gz
RUN tar -xvzf webdis-$WEBDIS_VERSION.tar.gz
RUN cd webdis-$WEBDIS_VERSION && make && make install
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chgrp -R 0 /app && chmod -R g+rwX /app
EXPOSE 7379
ENTRYPOINT ["./entrypoint.sh"]