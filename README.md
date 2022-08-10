# Dotbot Template

Template repository for advanced [Dotbot](https://github.com/anishathalye/dotbot) configuration.

For getting started, please review the [Wiki](https://github.com/ecarlson94/dotbot-template/wiki)!

The structure of this repository is heavily inspired by [vsund](https://github.com/vsund/dotfiles) and [vbrandl](https://github.com/vbrandl/dotfiles).

## Table of Contents
<!-- TOC GFM -->

- [Dependencies](#dependencies)
- [Installation](#installation)
  - [For installing a predefined profile:](#for-installing-a-predefined-profile)
    - [Single profile](#single-profile)
    - [Multiple profiles](#multiple-profiles)
    - [Ignoring certain lines](#ignoring-certain-lines)
  - [For installing configurations](#for-installing-configurations)
    - [Single configuration](#single-configuration)
    - [Multiple configurations](#multiple-configurations)
    - [Running with sudo](#running-with-sudo)
    - [Using shell ENVs](#using-shell-envs)
      - [Why?](#why)
      - [How to enable](#how-to-enable)
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

---

### For installing a predefined profile:

```bash
~/.REPO$ ./install-profile <profile ...>
```

See [meta/profiles/](./meta/profiles) for available profiles

#### Single profile

Ex:

```bash
~/.REPO$ ./install-profile exampleOS1
```

#### Multiple profiles

Ex:

```bash
~/.REPO$ ./install-profile exampleOS1 exampleOS2 exampleOS3
```

#### Ignoring certain lines

In order to ignore certain lines in a profile, add `#` at beginning of the line.

Ex:

```bash
example-config-1
# example-config-2-sudo    # this will be ignored
example-config-3
```

`example-config-2-sudo` is ignored and will not run

---

### For installing configurations

```bash
~/.REPO$ ./install-standalone <configs...>
```

See [meta/configs/](./meta/configs) for available configurations

#### Single configuration

Ex:

```bash
~/.REPO$ ./install-standalone example-config-1
```

#### Multiple configurations

Ex:

```bash
~/.REPO$ ./install-standalone example-config-1 example-config-3
```

#### Running with sudo

_*Note:*_ Any configuration can be run as sudo by adding `-sudo` to the end of it when invoking the install script.
_DO NOT_ run the script as a sudoer.

Ex:

```bash
~/.REPO$ ./install-standalone example-config-2-sudo
```

---

#### Using shell ENVs

Using ENVs in a config can be used to simplify a dotbot config.

Ex:
using ENV `ALACRITTY_CONFIG_PATH` (assuming you have it set somewhere)

then in a config
`./meta/configs/alacritty.yaml`

```yaml
- link:
    $ALACRITTY_CONFIG_PATH: tools/alacritty/alacritty.yml
```

This will use `ALACRITTY_CONFIG_PATH` as an ENV to set the symlink of the file

##### Why?

Managing ENVs in one place makes things easier when dealing with ENVs in a config.
If a filepath of an ENV is changed, then there's no need to update the dotbot config

##### How to enable

- First you need a file that loads ENV, Ex: `bash_profile`, `zshenv`
- Set your ENVs in there

  - Ex:

    ```bash
      export XDG_DATA_HOME="$HOME/.local/share"
      export XDG_STATE_HOME="$HOME/.local/state"
      export XDG_CONFIG_HOME="$HOME/.config"
      export XDG_CACHE_HOME="$HOME/.cache"
      export ALACRITTY_CONFIG_PATH="$XDG_CONFIG_HOME/alacritty/alacritty.yml"
    ```

- enable usage of ENV (assuming ENV file is placed in `./tools/zsh/zshenv`)
  - https://github.com/ecarlson94/dotbot-template/blob/aaddada1c9589f74d43c247b6d174abdb324b448/install-standalone#L47
  - https://github.com/ecarlson94/dotbot-template/blob/aaddada1c9589f74d43c247b6d174abdb324b448/install-standalone#L120
    - disable https://github.com/ecarlson94/dotbot-template/blob/aaddada1c9589f74d43c247b6d174abdb324b448/install-standalone#L122

---

## Contents

### Profiles

<pre>
meta/profiles
├── <a href="./meta/profiles/exampleOS1" title="exampleOS1">exampleOS1</a>
├── <a href="./meta/profiles/exampleOS2" title="exampleOS2">exampleOS2</a>
└── <a href="./meta/profiles/exampleOS3" title="exampleOS3">exampleOS3</a>
</pre>

---

### Configs

<pre>
meta
├── <a href="./meta/base.yaml" title="base.yaml">base.yaml</a>
└── configs/
    ├── <a href="./meta/configs/example-config-1.yaml" title="example-config-1.yaml">example-config-1.yaml</a>
    ├── <a href="./meta/configs/example-config-2.yaml" title="example-config-2.yaml">example-config-2.yaml</a>
    └── <a href="./meta/configs/example-config-3.yaml" title="example-config-3.yaml">example-config-3.yaml</a>
</pre>

---

## License

This software is hereby released under an MIT License. That means you can do whatever you want with conditions only requiring preservation of copyright and license notices.
See [LICENSE](./LICENSE) for details.
