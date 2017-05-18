#!/usr/bin/env bash

echo "macos-x86_64/deploy.sh"

export PATH="/usr/local/opt/qt/bin:$PATH"

cd "$VAGRANT_BUILD_DIR"
make -j 1 deploy
