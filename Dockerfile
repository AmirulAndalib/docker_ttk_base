FROM ubuntu:20.04

WORKDIR /torapp

ENV DEBIAN_FRONTEND noninteractive

RUN chmod -R 777 /torapp

RUN apt-get -qq update -y && \
    apt-get -qq install -y --no-install-recommends \
        curl git wget aria2 ca-certificates \
        python3 python3-pip \
        tzdata \
        software-properties-common gnupg2 gpg-agent \
        ffmpeg mediainfo unzip p7zip-full p7zip-rar \
        libcrypto++-dev libssl-dev libc-ares-dev libcurl4-openssl-dev \
        libsqlite3-dev libsodium-dev && \
    ln -fs /usr/share/zoneinfo/Asia/Dhaka /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable && \
    apt-get -qq install -y qbittorrent-nox && \
    curl -sL https://rclone.org/install.sh | bash && \
    apt-get autoremove -qy

RUN curl -sL https://github.com/viswanathbalusu/megasdkrest/releases/download/v0.1.4/megasdkrest-amd64 -o /usr/local/bin/megasdkrest && \
    chmod +x /usr/local/bin/megasdkrest
