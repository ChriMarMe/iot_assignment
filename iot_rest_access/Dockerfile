FROM node:14.18.3-bullseye-slim

RUN apt-get update &&                          \
    apt-get install -y --no-install-recommends \
    git

WORKDIR /home/riot/Uni/IoT/SBL
COPY .env .env

RUN set -eux;   \
    export GIT_SSL_NO_VERIFY=1;     \
    git clone --depth=1 https://github.com/ChriMarMe/iot_rest_access;

WORKDIR /home/riot/Uni/IoT/SBL/iot_rest_access

CMD ["node", "server.js"]