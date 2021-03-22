#!/usr/bin/env bash

cd meta/alacritty
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
rustup default stable
cargo build --release
cp target/release/alacritty /usr/local/bin
cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install extra/linux/Alacritty.desktop
cd ../../
