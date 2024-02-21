# MariaDB 10.11 - Alpine 3.19

https://alpine.pkgs.org/3.19/alpine-main-x86_64/mariadb-10.11.6-r0.apk.html

```bash
$ mysql --version
mysql Ver 15.1 Distrib 10.11.6-MariaDB, for Linux (x86_64) using readline 5.1

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
$ sudo docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
mariadb      10.11     ff5bcff8f85c   19 seconds ago   281MB
```