#!/usr/bin/env bash

echo "linux-x86/build.sh"

export PATH="/opt/qt57/bin:$PATH"

cd "$VAGRANT_BUILD_DIR"
qmake -r CONFIG-=debug CONFIG+=release "$VAGRANT_SOURCE_DIR"/*.pro
make -j 1
