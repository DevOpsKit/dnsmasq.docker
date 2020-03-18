ARG ALPINE_VERSION=3.9.5
ARG VERSION=0.0.0.0

FROM alpine:$ALPINE_VERSION

LABEL version=${VERSION}
LABEL description="Alpine based dnsmasq image. Configurable from dnsmasq command options."
LABEL maintainer="devopskit@gmail.com"

WORKDIR /

COPY files/entrypoint.sh /entrypoint.sh

RUN apk add --no-cache dnsmasq bash && chmod 775 /entrypoint.sh

VOLUME /data
EXPOSE 53/udp

ENTRYPOINT ["/entrypoint.sh"]