FROM ubuntu:bionic

RUN apt-get update \
    && apt-get install -y --install-recommends \
    git \
    gperf \
    libncurses5-dev \
    flex \
    bison \
    gcc-arm-none-eabi \
    genromfs \
    pkg-config \
    autoconf \
    automake \
    cmake \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://bitbucket.org/nuttx/tools.git /opt/tools \
    && cd /opt/tools/kconfig-frontends \
    && ./configure --disable-shared \
    && make \
    && make install \
    && rm -rf /opt/tools
