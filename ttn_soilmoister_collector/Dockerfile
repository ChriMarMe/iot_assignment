FROM golang:1.17-bullseye

RUN apt-get update &&                          \
    apt-get install -y --no-install-recommends \
    git                                             \
    make &&                                         \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/riot/Uni/IoT/SBL
COPY .env .env

RUN set -eux;                                                                   \
    git clone --depth=1 https://github.com/ChriMarMe/ttn-soilmoister-collector;  \
    cd ttn-soilmoister-collector;                                               \
    go build .

RUN set -eux;   \
    cd ttn-soilmoister-collector            \
    ./ttn-soilmoister-collector

CMD ["./ttn-soilmoister-collector/ttn-soilmoister-collector"]