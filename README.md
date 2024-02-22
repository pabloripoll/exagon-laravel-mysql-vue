# Hexagonal Design Example

The [Hexagonal Architecture](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)), or ports and adapters architecture, is an architectural pattern used in software design. It aims at creating loosely coupled application components that can be easily connected to their software environment by means of ports and adapters. This makes components exchangeable at any level and facilitates test automation.

The hexagonal architecture was invented by Alistair Cockburn in an attempt to avoid known structural pitfalls in object-oriented software design, such as undesired dependencies between layers and contamination of user interface code with business logic, and published in 2005. [...]

The intention of this repository is for the study and testing of use cases where we will test how to develop a service with a given stack taking into account the complete migration of the same to a completely different language without losing the goal of keeping the functionality of the software running without loss - so it is known as [Domain Drive Design](https://en.wikipedia.org/wiki/Domain-driven_design).


## About

Project code is **lamyvuered** meaning that uses Laravel, MySQL, Vue & Redis.

## Improvements

* Built on the lightweight and secure Alpine Linux distribution
* Multi-platform, supporting AMD4, ARMv6, ARMv7, ARM64
* Very small Docker image size (+/-40MB)
* Uses PHP FPM 8.3 for the best performance, low CPU usage & memory footprint
* Optimized for 100 concurrent users
* Optimized to only use resources when there's traffic (by using PHP-FPM's `on-demand` process manager)
* The services Nginx, PHP-FPM and supervisord run under a non-privileged user (docker) to make it more secure
* The logs of all the services are redirected to the output of the Docker container (visible with `docker logs -f <container name>`)
* Follows the KISS principle (Keep It Simple, Stupid) to make it easy to understand and adjust the image to your needs

## Services by group

### Bucket

- Custom framework PHP FPM 8.3 / Nginx 1.24 / Alpine 3.19

### Adminer
- **Frontend** Vue 3 / Node 21.6 / Alpine 3.19
- **Backtend** Laravel 10 / PHP FPM 8.3 / Nginx 1.24 / Alpine 3.19
- **Database** MariaDB 15 / Alpine 3.19


Docker images
```
$ sudo docker images
REPOSITORY   TAG                        IMAGE ID       CREATED          SIZE
admin-vue    node-21.6-alpine-3.19      caecd49cca4e   7 seconds ago    278MB
admin-api    php-8.3-alpine-3.19        323acb32b160   18 seconds ago   199MB
admin-db     mariadb-15.1-alpine-3.19   b61372b69427   21 seconds ago   333MB
bucket       php-8.3-alpine-3.19        db5d35a07509   31 seconds ago   199MB
```

Docker statistics
```
$ sudo docker stats --no-stream
CONTAINER ID   NAME                             CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O         PIDS
38945f5603eb   exagon-webadmin-lamyvuered       0.28%     133.8MiB / 7.636GiB   1.71%     44.7kB / 9.17MB   18.6MB / 4.1kB    34
ad543c8ce376   exagon-webadmin-api-lamyvuered   0.01%     35.18MiB / 7.636GiB   0.45%     213kB / 200kB     2.09MB / 242kB    11
c99399797769   exagon-webadmin-db-lamyvuered    0.01%     171.3MiB / 7.636GiB   2.19%     14.7kB / 1.64kB   10.9MB / 18.7MB   20
96a649c158f1   exagon-bucket-lamyvuered         2.69%     38.12MiB / 7.636GiB   0.49%     219kB / 205kB     2.48MB / 8.19kB   11
```




Distributed system for an commerce

- eShop
```
.
├── file0
└── foo
    ├── bar
    │   └── file2
    └── file1
```

- Backoffice Admin
```
.
├── file0
└── foo
    ├── bar
    │   └── file2
    └── file1
```

- Files Bucket
```
.
├── file0
└── foo
    ├── bar
    │   └── file2
    └── file1
```

## Threads