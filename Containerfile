# Multi-stage build

## Build ublue-os-base
FROM quay.io/fedora/fedora-coreos:stable

COPY etc /etc

RUN sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    systemctl enable rpm-ostreed-automatic.timer && \
    ostree container commit

RUN rpm-ostree install -y rke2-server && \
    ostree container commit

