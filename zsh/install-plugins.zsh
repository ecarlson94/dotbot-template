#!/usr/bin/env zsh

# Check if zplug is installed
if [ ! -d ~/.zplug ]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh
    zplug "zplug/zplug", hook-build:"zplug --self-manage"
fi

test -e ~/.dircolors && \
   eval `dircolors -b ~/.dircolors`

source ~/.zplug/init.zsh
source ~/.zsh/custom/plugins.zsh

if [[ ! -v TERM ]]; then export TERM=xterm; fi
if ! zplug check; then
    zplug install
fi
