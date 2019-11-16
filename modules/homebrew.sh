#!/bin/bash

install_brew() {
    echo "Installing brew if not already present."
    # Install homebrew and cask
    if test ! $(which brew)
    then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew tap caskroom/cask
    brew update
    fi
}
