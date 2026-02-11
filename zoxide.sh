#!/bin/bash

if [ -x "$(command -v zoxide)" ]; then
    echo "Zoxide is already installed"
    exit 0
fi

sudo apt install fzf

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo 'eval "$(zoxide init bash --cmd cd)"' >> ~/.bashrc
