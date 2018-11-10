#!/bin/sh

letsencrypt() {
    while true
    do
        sleep 60
        certbot --nginx -d dekvek.com -d www.dekvek.com
    done
}

letsencrypt &

nginx -g 'daemon off;'
