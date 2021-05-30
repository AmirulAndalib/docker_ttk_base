FROM ubuntu:21.04

WORKDIR /torapp

ENV TZ Asia/Dhaka
ENV DEBIAN_FRONTEND noninteractive

RUN chmod -R 777 /torapp

RUN set -xe && \
    apt-get -qq update -y && \
    apt-get -qq install -y --no-install-recommends \
        curl git wget \
        python3 python3-pip \
        aria2 \
        software-properties-common \
        ffmpeg mediainfo unzip p7zip-full p7zip-rar \
        libcrypto++-dev libssl-dev libc-ares-dev libcurl4-openssl-dev \
        libsqlite3-dev libsodium-dev

RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
RUN apt-get -qq install -y qbittorrent-nox

RUN curl -sL https://github.com/jaskaranSM/megasdkrest/releases/download/v0.1/megasdkrest -o /usr/local/bin/megasdkrest && \
    chmod +x /usr/local/bin/megasdkrest

RUN curl -sL https://rclone.org/install.sh | bash

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
