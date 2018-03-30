FROM ubuntu:16.04
LABEL maintainer="baseboxorg@outlook.com"

LABEL Description="This image is used to test my dotfiles installation and running"

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# Set locale to UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

# Initialize
RUN \
    apt-get -qq -y update && \
    apt-get install -qq -y --no-install-recommends \
    autoconf \
    wget \
    sudo \
    zsh \
    vim \
    git \
    curl \
    tmux \
    python3 \
    python3-setuptools \
    apt-transport-https \
    ca-certificates \
    build-essential \
    curl \
    lsb-release \
    locales && \
    locale-gen $LANG && \
    /usr/sbin/update-locale LANG=$LANG && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# create user
RUN useradd -ms /bin/bash ubuntu
RUN echo 'voodev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
ENV HOME=/home/ubuntu
USER ubuntu
WORKDIR /home/ubuntu
