# Docker nginx

### build
```
$ docker build -f Dockerfile -t nginx-$(date +%y%m%d) --no-cache .
```

### run
```
$ docker rm nginx-$(date +%y%m%d)
$ docker run --name nginx-$(date +%y%m%d) -e TIMEZONE=Asia/Tokyo -e PROXY_URL=http://google.com/ -p8080:8080 -p8123:8123 nginx-$(date +%y%m%d)
```

## Verify
- Port8080: Reverse Proxy
  - Ex) proxy_url: http://checkip.amazonaws.com
```
$ curl http://127.0.0.1:8080
203.0.113.1/24
```

- Port8123: nginx status
```
$ curl http://127.0.0.1:8123/
Active connections: 1 
server accepts handled requests
 660 660 660 
Reading: 0 Writing: 1 Waiting: 0 
```


### Cloud Run
- GCPのCloudShell

- DockeHubから image pull
````
$ docker image pull m120/docker-nginx-reverseproxy
```

- tag つける
```
$ docker tag m120/docker-nginx-reverseproxy gcr.io/{GCP Project ID}/docker-nginx-reverseproxy
```

- gcrにpush
```
$ docker push gcr.io/{GCP Project ID}/docker-nginx-reverseproxy
```