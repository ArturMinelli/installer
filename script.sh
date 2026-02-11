#!/bin/bash

cp -r configs/scripts ~/scripts

echo "Scripts copied to ~/scripts"

# Always add ~/scripts to PATH (and ~/.bashrc), even if already present
export PATH="$HOME/scripts:$PATH"

# Remove any previous export PATH lines adding ~/scripts from .bashrc
sed -i '/export PATH="\$HOME\/scripts:\$PATH"/d' ~/.bashrc
echo 'export PATH="$HOME/scripts:$PATH"' >> ~/.bashrc

echo "~/scripts has been added to your PATH and ~/.bashrc (overridden if it was present before)"