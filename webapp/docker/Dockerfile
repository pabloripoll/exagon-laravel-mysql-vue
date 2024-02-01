ARG NODE_VERSION=21.6.0
ARG ALPINE_VERSION=3.19.0

FROM alpine:${ALPINE_VERSION}

FROM node:${NODE_VERSION}-alpine AS node

# ALPINE CONFIG
RUN echo 'Configuring Alpine '.${ALPINE_VERSION}

RUN apk add openrc bash git helm openssh yq github-cli

#EXPOSE 80 443

# NODE CONFIG
RUN echo 'Configuring Node '.${NODE_VERSION}

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