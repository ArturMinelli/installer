#!/bin/bash

if [ -x "$(command -v alacritty)" ]; then
    echo "Alacritty is already installed"
    exit 0
fi

sudo apt install -y alacritty

mkdir -p ~/.config/alacritty

cp configs/alacritty.toml ~/.config/alacritty/alacritty.toml
