#!/usr/bin/env bash

echo "linux-x86/check.sh"

export PATH="/opt/qt57/bin:$PATH"

cd "$VAGRANT_BUILD_DIR"
make -j 1 check
