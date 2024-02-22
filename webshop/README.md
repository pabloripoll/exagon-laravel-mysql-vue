# Vue 3 + Vite

## App

## First - Installation

Install Vite
```bash
$ npm create vite@latest
$ npm install --save-dev vue-router
$ npm install --save axios vue-axios
```

Build application
```bash
$ sudo docker compose up --build --no-recreate -d
$ sudo docker compose up -d
$ sudo docker compose ps
$ sudo docker exec -it vite_docker sh
$ npm i && npm run dev
```

### Once installed
```bash
$ make build
$ sudo docker exec -it vite_docker sh
$ npm run dev
```

## Info

### Which Alpine
```bash
$ cat /etc/os-release
```

### Theme custom repair
```
/webapp/public/theme/color/custom/fix.js
```