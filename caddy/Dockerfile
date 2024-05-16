FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip

FROM caddy:latest

VOLUME [ "/etc/caddy" ]

COPY --from=builder /usr/bin/caddy /usr/bin/caddy