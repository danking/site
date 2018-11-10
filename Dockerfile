FROM alpine:3.8

RUN apk add --no-cache \
  nginx \
  acme-client \
  libressl \
  && rm /etc/nginx/conf.d/default.conf \
  && mkdir -p /run/nginx \
  && touch /run/nginx/nginx.pid

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY site.conf /etc/nginx/conf.d/site.conf
COPY site.sh ./
COPY html /var/www/html
RUN nginx -t
ENTRYPOINT ["./site.sh"]
