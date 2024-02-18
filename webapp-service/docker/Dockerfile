ARG NODE_VERSION=21.6.0
ARG ALPINE_VERSION=3.19.0

FROM node:${NODE_VERSION}-alpine AS node

FROM alpine:${ALPINE_VERSION}

# ALPINE CONFIG
RUN apk add openrc bash git helm openssh yq github-cli

#EXPOSE 80 443

# NODE CONFIG
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

RUN node -v

RUN npm install -g yarn --force
RUN npm -v
RUN yarn -v

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node"]
#CMD ["node", "path/to/project/script.js"]