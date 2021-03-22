FROM ruby:alpine
MAINTAINER Eric Carlson
LABEL maintainer "Eric Carlson <e.carlson94@gmail.com>"

ARG user=walawren
ARG group=wheel
ARG uid=1000
ARG dotfiles=dotfiles.git
ARG devcontainer=dev-container.git
ARG vcsprovider=github.com
ARG vcsowner=ecarlson94

USER root

RUN \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk upgrade --no-cache && \
    apk add --update --no-cache \
        sudo \
        ncurses \
        ca-certificates \
        libressl \
        git git-doc \
        python3 \
        python3-dev \
        py3-pip \
        perl \
        openssh \
        bash \
        bash-completion \
        cmake \
        ctags \
        file \
        curl \
        build-base \
        gcc \
        coreutils \
        wget \
        gnupg-scdaemon \
        pcsc-lite \
        gnupg \
        npm \
        yarn \
        neovim \
        zsh \
        fontconfig \
        ripgrep \
        tmux \
        docker \
        docker-compose \
        less \
        go

RUN \
    echo "%${group} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    adduser -D -G ${group} ${user} && \
    addgroup ${user} docker

COPY ./ /home/${user}/.dev-container/
RUN \
    git clone --recursive https://${vcsprovider}/${vcsowner}/${dotfiles} /home/${user}/.dotfiles && \
    chown -R ${user}:${group} /home/${user}/.dotfiles && \
    chown -R ${user}:${group} /home/${user}/.dev-container && \
    cd /home/${user}/.dev-container && \
    git remote set-url origin git@${vcsprovider}:${vcsowner}/${devcontainer} && \
    cd /home/${user}/.dotfiles && \
    git remote set-url origin git@${vcsprovider}:${vcsowner}/${dotfiles}

USER ${user}
ARG ghVersion=1.7.0
RUN \
    cd $HOME/.dotfiles && \
    ./install-profile linux && \
    cd $HOME/.dev-container && \
    if [ ! -d ~/.fzf ]; then git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; fi && ~/.fzf/install --key-bindings --completion --no-update-rc && \
    gem install tmuxinator && \
    go get -u github.com/boyter/scc/ && \
    wget -O ./ghcli.tar.gz https://github.com/cli/cli/releases/download/v${ghVersion}/gh_${ghVersion}_linux_amd64.tar.gz && \
    mkdir ghcli && \
    tar -xvf ghcli.tar.gz -C ./ghcli && \
    sudo cp ghcli/gh_${ghVersion}_linux_amd64/bin/gh /usr/bin && \
    rm -rf ghcli && \
    rm ghcli.tar.gz && \
    ./install-standalone \
        zsh-dependencies \
        zsh-plugins \
        vim-dependencies \
        vim-plugins \
        tmux-plugins \
        gnupg-configure

ENV HISTFILE=/config/.zsh_history

CMD [ "zsh" ]
