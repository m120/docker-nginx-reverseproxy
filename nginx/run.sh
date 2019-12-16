#!/bin/sh

# Set timezone
if [ -z "${TIMEZONE}" ]
then
    export TIMEZONE="Etc/GMT"
else
    echo "TIMEZONE is ${TIMEZONE}"
fi
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime

# replace PROXY_URL
if [ -z "${PROXY_URL}" ]
then
    export PROXY_URL="http://checkip.amazonaws.com"
else
    echo "PROXY_URL is ${PROXY_URL}"
fi

sed -i -e "s|_REPLACE_URL_|"${PROXY_URL}"|" /etc/nginx/nginx.conf
cat /etc/nginx/nginx.conf

nginx -g "daemon off;"