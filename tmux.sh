#!/bin/bash

if [ -x "$(command -v tmux)" ]; then
    echo "Tmux is already installed"
    exit 0
fi

sudo apt install tmux -y

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.config/tmux
cp configs/tmux.conf ~/.config/tmux/tmux.conf

~/.tmux/plugins/tpm/bin/install_plugins

tmux source-file ~/.config/tmux/tmux.conf 2>/dev/null || true
