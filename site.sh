#!/bin/sh

set -ex

nginx

while true
do
    certbot --nginx -d dekvek.com -d www.dekvek.com
    sleep 60
done
