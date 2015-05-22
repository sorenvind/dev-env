#!/bin/bash

# Inspiration: http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html

# Set up OSX settings
./OSXsettings.sh

# Install fonts
unzip -q Input-Font.zip -d inputfont
cp inputfont/Input_Fonts/*/*/*.ttf /Library/Fonts/
rm -fr inputfont

# Install homebrew and cask
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install caskroom/cask/brew-cask

# Install latest zsh and oh-my-zsh
brew install zsh
curl -L http://install.ohmyz.sh | sh

# Install common sanity
brew install vim wget curl tree go node

# Install zshrc and vim config
cp -f soren.vimrc ~/.vimrc
cp -f soren.zshrc ~/.zshrc

#echo "Install solarized terminal template to finish installation:"
#echo "  Use solarized-dark-sovi.terminal as your terminal default colors."

echo "Setup terminal to use Pro template, with Input Mono Extra Light 12pt and block cursor."
