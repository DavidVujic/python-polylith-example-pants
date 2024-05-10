#!/usr/bin/env bash
pants export

PANTS_VENV_PATH="./dist/export/python/virtualenvs/python-default"
PTH_FILE_NAME="local-dev-extra.pth"
VENV_SITE_PACKAGES=$(find $PANTS_VENV_PATH -name site-packages)
ROOTS=($(pants roots))

# create a .pth file with the root absolute paths
echo "$(pwd)" > "$VENV_SITE_PACKAGES/$PTH_FILE_NAME"

for root in $ROOTS
do
  echo "$(pwd)/$root" >> "$VENV_SITE_PACKAGES/$PTH_FILE_NAME"
done

# Create a .venv symlink
PYTHON_VERSION=$(python --version | sed 's/Python //g')
ln -s $PANTS_VENV_PATH/$PYTHON_VERSION ./.venv
