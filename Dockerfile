FROM alpine:latest
COPY . .
RUN set -xe \
    && apk add --update --no-progress dhcp \
    && rm -rf /var/cache/apk/*
RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]
RUN ["mv", "./dhcpd.conf", "/etc/dhcp/dhcpd.conf"]
CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]