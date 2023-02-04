#!/bin/bash

echo "Starting Uptime-Kuma + Tailscale"

if [ -n "$TAILSCALE_AUTHKEY" ]; then
    if [ -z "$TAILSCALE_EXITNODE" ]; then
        export TAILSCALE_EXITNODE="false"
    else
        echo "TAILSCALE_EXITNODE is set to true, enabling exit node"
        export TAILSCALE_EXITNODE="true"
    fi
    echo "Starting Tailscale"
    /app/tailscaled  --tun=userspace-networking &
    until /app/tailscale up --authkey=$TAILSCALE_AUTHKEY --hostname=$TAILSCALE_HOSTNAME --advertise-exit-node=$TAILSCALE_EXITNODE;
    do
        echo "Tailscale is not ready yet, retrying in 5 seconds..."
        sleep 5
    done
else
    echo "TAILSCALE_AUTHKEY is not set, not starting Tailscale"
fi

if [ "$ONLY_TAILSCALE" = "true" ]; then
    echo "ONLY_TAILSCALE is set to true, setting host to tailscale ip"
    export HOST=$(tailscale ip | head -n 1)
    /app/tailscale serve / proxy 80
else
    echo "ONLY_TAILSCALE is not set, setting host to localhost"
    export HOST="127.0.0.1"
fi

cd /app && node server/server.js --port 80 --host $HOST 