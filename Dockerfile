FROM alpine:3.7
RUN apk --no-cache add ca-certificates
RUN set -ex; \
	apk add --no-cache --virtual .fetch-deps libressl; \
	wget -O /usr/local/bin/traefik "https://github.com/containous/traefik/releases/download/v1.6.5/traefik_linux-amd64"; \
	apk del .fetch-deps; \
	chmod +x /usr/local/bin/traefik
COPY entrypoint.sh /
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]

# Metadata
LABEL org.label-schema.vendor="Containous" \
      org.label-schema.url="https://traefik.io" \
      org.label-schema.name="Traefik" \
      org.label-schema.description="A modern reverse-proxy" \
      org.label-schema.version="v1.6.5" \
      org.label-schema.docker.schema-version="1.0"
