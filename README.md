# Nginx Reverse Proxy
## For Docker Hub
### How to use
- docker run
```
$ docker run -p8080:8080 -e TIMEZONE=Asia/Tokyo -e PROXY_URL=http://example.com m120/docker-nginx-reverseproxy
```

----

## git clone (docker-compose)
### How to use
- git clone
```
$ git clone https://github.com/m120/docker-nginx-reverseproxy.git
$ cd docker-nginx-reverseproxy
```

- Docker Run
```
$ export PROXY_URL="http://checkip.amazonaws.com" 
$ docker-compose up -d --force-recreate
```

### Browser Access (or curl)
`http://127.0.0.1:8080/`

## port mapping
- 8080: Proxy port
- 8123: ngixn status
- 9090: Prometheus

## Todo
- [ ] SSL
