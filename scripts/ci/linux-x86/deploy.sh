#!/usr/bin/env bash

echo "linux-x86/deploy.sh"

export PATH="/opt/qt57/bin:$PATH"

cd "$VAGRANT_BUILD_DIR"
make -j 1 deploy
