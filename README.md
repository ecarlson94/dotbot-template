# Dotbot Template
Template repository for advanced [Dotbot](https://github.com/anishathalye/dotbot) configuration.

For getting started, please review the [Wiki](https://github.com/ecarlson94/dotbot-template/wiki)!

The structure of this repository is heavily inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

## Table of Contents
<!-- TOC GFM -->

- [Dependencies](#dependencies)
- [Installation](#installation)
    - [For installing a predefined profile:](#for-installing-a-predefined-profile)
    - [For installing single configurations:](#for-installing-single-configurations)
- [Contents](#contents)
    - [Profiles](#profiles)
    - [Configs](#configs)
- [License](#license)

<!-- /TOC -->

## Dependencies
- git

## Installation

```bash
~$ git clone --recursive https://github.com/OWNER/REPO.git ~/.REPO
~$ cd ~/.REPO
```

### For installing a predefined profile:

```bash
~/.REPO$ ./install-profile <profile> [<configs...>]
```
See [meta/profiles/](./meta/profiles) for available profiles


### For installing single configurations:

```bash
~/.REPO$ ./install-standalone <configs...>
```
See [meta/configs/](./meta/configs) for available configurations

_*Note:*_ Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
*DO NOT* run the script as a sudoer.

## Contents

### Profiles
<pre>
meta/profiles
├── <a href="./meta/profiles/exampleOS1" title="exampleOS1">exampleOS1</a>
└── <a href="./meta/profiles/exampleOS2" title="exampleOS2">exampleOS2</a>
</pre>

### Configs
<pre>
meta
├── <a href="./meta/base.yaml" title="base.yaml">base.yaml</a>
└── configs
    ├── <a href="./meta/configs/example-config-1.yaml" title="example-config-1.yaml">example-config-1.yaml</a>
    └── <a href="./meta/configs/example-config-2.yaml" title="example-config-2.yaml">example-config-2.yaml</a>
</pre>

## License
This software is hereby released under an MIT License. That means you can do whatever you want with conditions only requiring preservation of copyright and license notices.
See [LICENSE](./LICENSE) for details.
