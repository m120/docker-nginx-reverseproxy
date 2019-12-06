FROM alpine
MAINTAINER m120

ARG TIMEZONE
ARG PROXY_URL

# INSTALL: pkg
RUN apk --update add \
  tzdata nginx && \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# ADD: Configs
COPY ${pwd}/nginx.conf /etc/nginx/nginx.conf

# SETTING:
RUN set -x \
    # Timezone
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    # Nginx 
    adduser -D -g 'www' www && \
    install -o www -g www -d /var/lib/nginx && \
    install -o www -g www -d /www && \
    install -o www -g www -d /var/tmp/nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    # REPLACE URL
    sed -i -e "s|_REPLACE_URL_|"${PROXY_URL}"|" /etc/nginx/nginx.conf && \
    cat /etc/nginx/nginx.conf


STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
