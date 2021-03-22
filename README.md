# Dev Container
Dotfile & dev environment dependency management using [Dotbot](https://github.com/anishathalye/dotbot) and [Docker](https://www.docker.com/).

Quick uptime with containerized dotfiles and minimal dependency installation on host.
Most dependencies exist in the [walawren/dev-container](https://hub.docker.com/r/walawren/dev-container) container image and the container
is executed like a binary through [shims links](./meta/configs/shims.yaml) (currently only a [zsh wrapper](./shims/zsh.sh) around [shim.sh](./shims/shim.sh) is needed).

If you want to view the dotfiles used within the container, please review [ecarlson94/dotfiles](https://github.com/ecarlson94/dotfiles).

The structure of this repository is heavily inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

## Table of Contents
<!-- TOC GFM -->

- [Dependencies](#dependencies)
- [Installation](#installation)
    - [For installing a predefined profile:](#for-installing-a-predefined-profile)
        - [Set global git user name and email](#set-global-git-user-name-and-email)
    - [For installing single configurations:](#for-installing-single-configurations)
    - [Post-Installation](#post-installation)
        - [Mac or Ubuntu Desktop](#mac-or-ubuntu-desktop)
        - [WSL or headless linux](#wsl-or-headless-linux)
    - [Acquiring the latest image](#acquiring-the-latest-image)
- [Contents](#contents)
    - [Profiles](#profiles)
    - [Configs](#configs)
- [License](#license)

<!-- /TOC -->

## Dependencies
- git
- docker (automatically installed)

## Installation

```bash
~$ git clone --recursive https://github.com/ecarlson94/dev-container.git ~/.dev-container
~$ cd ~/.dev-container
```

### For installing a predefined profile:

```bash
~/.dev-container$ ./install-profile <profile> [<configs...>]
```
See [meta/profiles/](./meta/profiles) for available profiles


#### Set global git user name and email

```bash
~/.dev-container$ ./install-profile <profile> git-override
```

### For installing single configurations:

```bash
~/.dev-container$ ./install-standalone <configs...>
```
See [meta/configs/](./meta/configs) for available configurations

_*Note:*_ Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
*DO NOT* run the script as a sudoer.

### Post-Installation
You can run the above installation commands safely multiple times, if you think that helps with better installation.

#### Mac or Ubuntu Desktop
1. Exit terminal
1. Start Alacritty

#### WSL or headless linux
1. Restart terminal
1. Run `zsh`
1. (WSL) Run `compaudit | xargs chmod go-w`

### Acquiring the latest image
1. Quit Alacritty
1. Open terminal
1. Run `docker rmi walawren/dev-container`
1. Reopen Alacritty

## Contents

### Profiles
<pre>
meta/profiles
├── <a href="./meta/profiles/mac" title="mac">mac</a>
├── <a href="./meta/profiles/ubuntu" title="ubuntu">ubuntu</a>
└── <a href="./meta/profiles/ubuntu-desktop" title="ubuntu-desktop">ubuntu-desktop</a>
</pre>

### Configs
<pre>
meta
├── <a href="./meta/base.yaml" title="base.yaml">base.yaml</a>
└── configs
    ├── <a href="./meta/configs/alacritty-cargo.yaml" title="alacritty-cargo.yaml">alacritty-cargo.yaml</a>
    ├── <a href="./meta/configs/alacritty-ubuntu-deps.yaml" title="alacritty-ubuntu-deps.yaml">alacritty-ubuntu-deps.yaml</a>
    ├── <a href="./meta/configs/apt.yaml" title="apt.yaml">apt.yaml</a>
    ├── <a href="./meta/configs/dotfiles-container.yaml" title="dotfiles-container.yaml">dotfiles-container.yaml</a>
    ├── <a href="./meta/configs/fonts-linux.yaml" title="fonts-linux.yaml">fonts-linux.yaml</a>
    ├── <a href="./meta/configs/fonts-mac.yaml" title="fonts-mac.yaml">fonts-mac.yaml</a>
    ├── <a href="./meta/configs/gnupg-configure.yaml" title="gnupg-configure.yaml">gnupg-configure.yaml</a>
    ├── <a href="./meta/configs/homebrew.yaml" title="homebrew.yaml">homebrew.yaml</a>
    ├── <a href="./meta/configs/host-dotfiles-linux.yaml" title="host-dotfiles-linux.yaml">host-dotfiles-linux.yaml</a>
    ├── <a href="./meta/configs/host-dotfiles-mac.yaml" title="host-dotfiles-mac.yaml">host-dotfiles-mac.yaml</a>
    ├── <a href="./meta/configs/shims.yaml" title="shims.yaml">shims.yaml</a>
    ├── <a href="./meta/configs/ubuntu-desktop.yaml" title="ubuntu-desktop.yaml">ubuntu-desktop.yaml</a> (contains packages that are gui based)
    ├── <a href="./meta/configs/tmux-plugins.yaml" title="tmux-plugins.yaml">tmux-plugins.yaml</a>
    ├── <a href="./meta/configs/vim-dependencies.yaml" title="vim-dependencies.yaml">vim-dependencies.yaml</a>
    ├── <a href="./meta/configs/vim-plugins.yaml" title="vim-plugins.yaml">vim-plugins.yaml</a>
    ├── <a href="./meta/configs/zsh-dependencies.yaml" title="zsh-dependencies.yaml">zsh-dependencies.yaml</a>
    └── <a href="./meta/configs/zsh-plugins.yaml" title="zsh-plugins.yaml">zsh-plugins.yaml</a>
</pre>

## License
This software is hereby released under an MIT License. That means you can do whatever you want with conditions only requiring preservation of copyright and license notices.
See [LICENSE](./LICENSE) for details.
