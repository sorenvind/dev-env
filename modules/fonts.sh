#!/bin/bash

install_fonts() {
    echo "Install fonts: Input, Hack, Fira Code, Source Code Pro"
    brew tap homebrew/cask-fonts
    brew cask install font-hack
    brew cask install font-input
    brew cask install font-fira-code
    brew cask install font-source-code-pro
}
