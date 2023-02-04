FROM louislam/uptime-kuma:1 as uptime-kuma


FROM alpine:latest as tailscale
WORKDIR /app
RUN apk add --no-cache curl
ENV TSFILE=tailscale_latest_amd64.tgz
RUN wget https://pkgs.tailscale.com/stable/${TSFILE} && \
    tar xzf ${TSFILE} --strip-components=1


FROM node:alpine
RUN apk update && apk add bash && apk add ca-certificates iptables ip6tables && rm -rf /var/cache/apk/*

COPY --from=uptime-kuma /app /app
COPY --from=tailscale /app/tailscaled /app/tailscaled
COPY --from=tailscale /app/tailscale /app/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

COPY . /app
RUN chmod +x /app/start.sh

EXPOSE 80
CMD ["bash", "/app/start.sh"]