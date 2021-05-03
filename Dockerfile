FROM ubuntu:20.10
RUN apt-get update
RUN apt-get -y --no-install-recommends install \
    zip \
    unzip \
    zsh \
    zsh-doc \
    neovim \
    ripgrep \
    ncurses-term \
    build-essential \
    mosh \
    ruby-full \
    ri \
    curl \
    git \
    tmux \
    openssh-server \
    pwgen \
    pass \
    gtypist \
    imagemagick \
    imagemagick-doc \
    graphviz \
    bvi \
    dos2unix \
    sqlite3 \
    sqlite3-doc \
    unrar \
    p7zip-full \
    android-tools-adb \
    android-tools-fastboot
