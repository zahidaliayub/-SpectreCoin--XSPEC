#!/usr/bin/env bash

echo "linux-x86/bootstrap.sh"

# 1. Resynchronizing the package index files from their sources...
sudo apt-get update -qq -y

# 2. Installing build tools...
sudo apt-get install build-essential libfontconfig1 -qq -y
sudo apt-get install libgl1-mesa-dev -qq -y

# 3. Installing pre-compiled Qt 5.x packages...
sudo add-apt-repository ppa:beineri/opt-qt571-xenial
sudo apt-get update -qq -y
sudo apt-get install qt57-meta-full -qq -y

# 4. Creating build directoty...
mkdir -p "$VAGRANT_BUILD_DIR"
cd "$VAGRANT_BUILD_DIR"
