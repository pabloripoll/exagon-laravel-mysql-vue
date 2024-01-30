# Hexagonal ERP / eCommerce Example
*(This repository is in development)*

## About

The aim of this repository is to present a development example model of an `HEXAGONAL SYSTEM` with two professional applications with its basic characteristics to be used/visited either by visitors/customers to buy the company products, or by company's administrative employees.

This is an hexagonal system example where a company has the following applications decoupling de `DRIVING SIDE` from the `DRIVEN SIDE`
```
.
├── ERP
│   ├── Frontend Application
│   └── Backend API service
└── eCommerce
    ├── Frontend Application
    └── Backend API service
```

It is designed to be deploy on Linux servers as micro services explained in the following tree
```
.
├── databases
│   ├── MariaDB
│   │   └── Detached service to gain performance in real scenario with Linux Debian 6.1 and MariaDB 11.2
│   │
│   └── MongoDB
│       └── Detached service to gain performance in real scenario
│
├── webapp
│   └── Frontend application for company customers in Linux Alpine 3.19, Node 21.3 & Vue 3 with Pinia
│
├── webapp-service
│   └── Backend API service
│
├── webadm
│   └── Frontend application for company employees in Linux Alpine 3.19, Node 21.3 & Vue 3 with Pinia
│
├── webadm-service
│   └── Backend API service in Alpine 3.19, Nginx and Laravel 10 with PHP 8.2
│
├── broker
│   └── Broker service with Linux Alpine and RabbitMQ
│
```

### Requirement

This project can be deployed on local or remote machine if it has the stack intalled or it has **Docker** and/or **Docker Compose** installed, the isolation enviroment configuration to run each application.

The directories name and enviroment variables values are already defined as default but it can be edited and must be update `./.env` file.

### Automatation
A Makefile has been developed to automate some repeatedly commands at the moment of restart any application or to watch system performance.

The following helper command will output the basic settings required to build the whole system
```bash
$ make system-check
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

## Troubleshoots & Helpers

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

If any of the ports required is busy check local enviroment for ports available
```bash
$ sudo lsof -i -P -n | grep LISTEN
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