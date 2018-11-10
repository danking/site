FROM alpine:3.8

RUN apk add --no-cache \
  nginx \
  cerbot \
  && adduser -S -D -H nginx \
  && rm -rf /etc/nginx/site-enabled/default

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY site.conf /etc/nginx/conf.d/site.conf
COPY html /var/www/html
RUN nginx -t

USER nginx

ENTRYPOINT ['bin/sh', '-c', 'site.sh']
