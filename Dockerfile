FROM kalilinux/kali-rolling

RUN DEBIAN_FRONTEND=non-interactive bash -c ' \
    apt-get update -qqy \
    && apt-get install -qqy python3 python3-pip python3-venv tor curl procps \
    && curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz | tar xzvf - -C / \
    && mkdir -p /etc/{fix-attrs.d,services.d}'

COPY rootfs/ /

ENTRYPOINT [ "/init" ]