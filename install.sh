#!/bin/bash

# Inspiration: http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html

# Set up OSX settings
./OSXsettings.sh

# Install fonts
unzip -q Input-Font.zip -d inputfont
cp inputfont/Input_Fonts/*/*/*.ttf /Library/Fonts/
rm -fr inputfont

# Install homebrew and cask
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew install caskroom/cask/brew-cask
fi

# Install latest zsh and oh-my-zsh
OMZ=~/.oh-my-zsh
if test ! -d $OMZ
then
  brew install zsh
  curl -L http://install.ohmyz.sh | sh
fi

# Slim down unneeded themes and plugins from oh-my-zsh
mkdir -p $OMZ/plugins_new
cp -R $OMZ/plugins/colorize $OMZ/plugins/git $OMZ/plugins/common-aliases $OMZ/plugins_new
rm -fr $OMZ/plugins
mv $OMZ/plugins_new $OMZ/plugins
mkdir -p $OMZ/themes_new
cp -R $OMZ/themes/robbyrussell.zsh-theme $OMZ/themes_new
rm -fr $OMZ/themes
mv $OMZ/themes_new $OMZ/themes
rm -fr $OMZ/.git

# Install common sanity
brew update
brew upgrade
brew install vim wget curl tree go node python

# Install python packages
pip install pygments requests

# Install zshrc and vim config
cp -f soren.vimrc ~/.vimrc
cp -f soren.zshrc ~/.zshrc
mkdir -p ~/.ssh
cp -f soren.ssh.config ~/.ssh/config

#echo "Install solarized terminal template to finish installation:"
#echo "  Use solarized-dark-sovi.terminal as your terminal default colors."

echo "Setup terminal to use Pro template, with Input Mono Extra Light 12pt and block cursor."
