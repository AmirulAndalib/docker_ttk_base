FROM ubuntu:20.04

WORKDIR /torapp

ENV TZ Asia/Dhaka
ENV DEBIAN_FRONTEND noninteractive

RUN chmod -R 777 /torapp

RUN apt-get -qq update -y && \
    apt-get -qq install -y --no-install-recommends \
        curl git wget ca-certificates \
        python3 python3-pip \
        aria2 \
        software-properties-common gnupg2 gpg-agent \
        ffmpeg mediainfo unzip p7zip-full p7zip-rar \
        libcrypto++-dev libssl-dev libc-ares-dev libcurl4-openssl-dev \
        libsqlite3-dev libsodium-dev && \
    apt-get autoremove -qy

RUN add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
RUN apt-get -qq install -y qbittorrent-nox

RUN curl -sL https://github.com/jaskaranSM/megasdkrest/releases/download/v0.1/megasdkrest -o /usr/local/bin/megasdkrest && \
    chmod +x /usr/local/bin/megasdkrest

RUN curl -sL https://rclone.org/install.sh | bash && \
    rclone config file >/dev/null
