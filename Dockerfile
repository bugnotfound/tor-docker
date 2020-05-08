FROM kalilinux/kali-rolling

ARG S6_VER=v1.21.8.0

RUN DEBIAN_FRONTEND=non-interactive bash -c " \
    apt-get update -qqy \
    && apt-get install -qqy python3 python3-pip python3-venv tor curl procps \
    && curl -L -s https://github.com/just-containers/s6-overlay/releases/download/${S6_VER}/s6-overlay-amd64.tar.gz | tar xzvf - -C / \
    && mkdir -p /etc/{fix-attrs.d,services.d}"

COPY rootfs/ /

ENTRYPOINT [ "/init" ]