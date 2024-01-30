# Hexagonal System Application

### Requirements
Define directory names and enviroment variables before start editing .env file in this root directory.

Some commands will help to set them all.

This will output the basic settings required
```bash
$ make system-check
```

Check local enviroment for ports available
```bash
$ sudo lsof -i -P -n | grep LISTEN
```

### Restart
If any root enviroment variable changed while any container was running, that container must be rebuild
```bash
$ make rebuild
```

## Project System
Each project is separated for a Hexagonal Design System. So, each one has its own directory in case of been deploy in Kubernetes or in different hosting services.

- Web Application = Alpine *(v3.19.0)*, NodeJS *(v21.6.0)*, Vue *(v3.3.11)* (Axios 1.6.5, Vue Axios 3.5.2) \
Source: https://github.com/nodejs/docker-node/tree/main

- Web Application Service = Alpine, NodeJS, ExpressJS, MongoDB \


## Requirements???
- Docker and Docker Compose
- Node & NPM installed locally

## Troubleshoots

## Which Alpine
```bash
$ cat /etc/os-release
```

### Docker
failed to update store for object type *libnetwork.endpointCnt: Key not found in store
```bash
$ sudo service docker restart
```

Stop docker container ${id} <- obtener el id con `$ sudo docker ps` //sudo docker compose down
```bash
$ sudo docker container ls
$ sudo rm /var/lib/docker/network/files/local-kv.db
$ sudo docker system prune
$ sudo service docker start
$ sudo kill $(sudo lsof -t -i:${PORT})
```

Kill used port
```bash
$ lsof -i :${PORT}
```

### Remove images
Example
```bash
$ sudo docker image rm -f mariadb:11.2
```

```bash
$ docker kill $(docker ps -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q);
```