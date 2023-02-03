FROM louislam/uptime-kuma:1
EXPOSE 3001
ENTRYPOINT ["/usr/bin/dumb-init", "--", "extra/entrypoint.sh"]
CMD ["node", "server/server.js"]