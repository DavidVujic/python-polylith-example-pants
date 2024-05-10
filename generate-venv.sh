#!/usr/bin/env bash
pants export

PTH_FILE_NAME="local-dev-extra.pth"
VENV_SITE_PACKAGES=$(find ./dist -name site-packages)
ROOTS=($(pants roots))

# create a .pth file with the root absolute paths
echo "$(pwd)" > "$VENV_SITE_PACKAGES/$PTH_FILE_NAME"

for root in $ROOTS
do
  echo "$(pwd)/$root" >> "$VENV_SITE_PACKAGES/$PTH_FILE_NAME"
done

# Create a .venv symlink
PYTHON_VERSION=$(python --version | sed 's/Python //g')
VENV=$(find ./dist -name $PYTHON_VERSION)
ln -s $VENV ./.venv
