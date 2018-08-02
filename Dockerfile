FROM ubuntu:16.04

MAINTAINER Neucrack CZD666666@gmail.com

# ENV PATH=

RUN DEBIAN_FRONTEND=noninteractive apt update \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends -qq \
        software-properties-common \
        build-essential \
        git \
        gcc-multilib \
        g++-multilib \
        lib32z1 \
        curl \
        tar

RUN add-apt-repository ppa:git-core/ppa \
    && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash \
    && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
        git-lfs \
    && git lfs install \
    && git clone https://github.com/Ai-Thinker-Open/GPRS_CSDTK.git /opt/GPRS_CSDTK \
    && cd /opt/GPRS_CSDTK && pwd && ls -al \
    && tar -xzvf CSDTK_Linux.tar.gz /opt/CSDTK \
    && mkdir /projects \
    && cd /opt/CSDTK \
    && ./setup.sh ./ /projects \
    && rm -rf /opt/GPRS_CSDTK \
    && DEBIAN_FRONTEND=noninteractive apt purge -y --auto-remove tar curl software-properties-common \
    rm -r /var/lib/apt/lists/* \

