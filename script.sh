#!/bin/bash

# Set default PROFILE_PATH if not already set
export PROFILE_PATH="${PROFILE_PATH:-.bashrc}"

cp -r configs/scripts ~/scripts

echo "Scripts copied to ~/scripts"

# Always add ~/scripts to PATH (and profile file), even if already present
export PATH="$HOME/scripts:$PATH"

# Remove any previous export PATH lines adding ~/scripts from profile file
sed -i '/export PATH="\$HOME\/scripts:\$PATH"/d' ~/"${PROFILE_PATH}"
echo 'export PATH="$HOME/scripts:$PATH"' >> ~/"${PROFILE_PATH}"

echo "~/scripts has been added to your PATH and ~/${PROFILE_PATH} (overridden if it was present before)"