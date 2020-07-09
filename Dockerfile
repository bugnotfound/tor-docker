FROM kalilinux/kali-rolling

ARG S6_VER=v2.0.0.1

RUN DEBIAN_FRONTEND=non-interactive bash -c " \
    apt-get update -qqy \
    && apt-get install -qqy python3 python3-pip python3-venv tor curl procps wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/just-containers/s6-overlay/releases/download/${S6_VER}/s6-overlay-amd64.tar.gz \
    && tar xzf s6-overlay-amd64.tar.gz --exclude="./bin" -C / \
    && tar xzf s6-overlay-amd64.tar.gz -C /usr ./bin \
    && rm s6-overlay-amd64.tar.gz \
    && mkdir -p /etc/{fix-attrs.d,services.d}"

COPY rootfs/ /

ENTRYPOINT [ "/init" ]
