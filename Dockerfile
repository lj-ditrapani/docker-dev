FROM ubuntu:20.10
RUN apt-get update
RUN apt-get -y upgrade
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
RUN chsh -s /usr/bin/zsh $USER
RUN git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
RUN ~/dotfiles/link.rb
RUN curl -s "https://get.sdkman.io" | bash
SHELL ["zsh", "-c"]
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 16.0.0.fx-zulu
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 15.0.2.fx-zulu
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 11.0.10.fx-zulu
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install java 8.0.282.fx-zulu
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install gradle
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install sbt
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install scala
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install kotlin
RUN source "$HOME/.sdkman/bin/sdkman-init.sh" && sdk install kscript
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
ENV NVM_DIR="/root/.nvm"
RUN \. "$NVM_DIR/nvm.sh" && nvm install --lts
RUN \. "$NVM_DIR/nvm.sh" && nvm install 12.22.0
RUN \. "$NVM_DIR/nvm.sh" && nvm install 10.24.0
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN chmod 700 ~/.gnupg
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qall
