#!/usr/bin/env bash

echo "macos-x86_64/bootstrap.sh"

# 2. Installing Homebrew...
export TRAVIS=true # Installation script won't ask for confirmation if TRAVIS is set to true
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 1. Configuring compiler...
brew install mas
mas install 497799835 # Xcode
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

# 3. Installing pre-compiled Qt 5.x packages...
brew install qt5

# 4. Creating build directoty...
mkdir -p "$VAGRANT_BUILD_DIR"
cd "$VAGRANT_BUILD_DIR"
