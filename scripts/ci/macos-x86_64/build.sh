#!/usr/bin/env bash

echo "macos-x86_64/build.sh"

export PATH="/usr/local/opt/qt/bin:$PATH"

cd "$VAGRANT_BUILD_DIR"
qmake -r CONFIG-=debug CONFIG+=release "$VAGRANT_SOURCE_DIR"/*.pro
make -j 1
