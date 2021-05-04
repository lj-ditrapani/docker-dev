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
RUN systemctl stop ssh.service && systemctl disable ssh.service
RUN git clone https://github.com/lj-ditrapani/dotfiles.git ~/dotfiles
RUN ~/dotfiles/link.rb
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"
RUN sdk install java 16.0.0.fx-zulu
RUN sdk install gradle
RUN sdk install sbt
RUN sdk install scala
RUN sdk install kotlin
RUN sdk install kscript
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
RUN nvm install --lts
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN chmod 700 ~/.gnupg
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim +PlugInstall +qall
