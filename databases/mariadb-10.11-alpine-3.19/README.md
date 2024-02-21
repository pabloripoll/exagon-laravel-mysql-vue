## MariaDB 15 - Alpine 3.19

*(Cannot connect container from host machine)*

[MariaDB 10.11.6-r0 for Alpine 3.19](https://alpine.pkgs.org/3.19/alpine-main-x86_64/mariadb-10.11.6-r0.apk.html)

```bash
$ mariadb --version
mariadb  Ver 15.1 Distrib 10.11.6-MariaDB, for Linux (x86_64) using readline 5.1

$ cat /etc/*-release
3.19.1
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.19.1
PRETTY_NAME="Alpine Linux v3.19"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://gitlab.alpinelinux.org/alpine/aports/-/issues"
```

```bash
$ sudo docker ps
CONTAINER ID   IMAGE                                COMMAND   CREATED          STATUS          PORTS                                       NAMES
2ce56b2ad0b2   lscr.io/linuxserver/mariadb:latest   "/init"   28 seconds ago   Up 26 seconds   0.0.0.0:8815->3306/tcp, :::8815->3306/tcp   exagon-webadm-db-lamyvuered

$ sudo docker images
REPOSITORY                    TAG       IMAGE ID       CREATED        SIZE
lscr.io/linuxserver/mariadb   latest    57921eb0df72   27 hours ago   333MB

$ sudo docker system df
TYPE            TOTAL     ACTIVE    SIZE      RECLAIMABLE
Images          1         1         332.7MB   0B (0%)
Containers      1         1         25.84kB   0B (0%)
Local Volumes   1         1         130.5MB   0B (0%)
Build Cache     0         0         0B        0B
```
