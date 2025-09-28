#!/bin/bash

install_brew() {
    echo "Installing brew if not already present."
    # Install homebrew and cask
    if test ! $(which brew)
    then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew doctor
    brew tap caskroom/cask
    brew update
    fi
}
