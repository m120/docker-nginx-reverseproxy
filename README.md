# Nginx Reverse Proxy

## How to use
### Docker Run
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