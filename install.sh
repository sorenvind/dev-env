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

# Install own utilities
mkdir ~/bin
cp -f git-subdir-status.sh ~/bin/
chmod +x ~/bin/*

# Install latest zsh and oh-my-zsh
OMZ=~/.oh-my-zsh
if test ! -d $OMZ
then
  brew install zsh
  curl -L http://install.ohmyz.sh | sh
fi

# Install common sanity
brew tap homebrew/dupes
brew update
brew upgrade
brew install vim wget curl tree go node python ruby make git

# Install python packages
pip install pygments requests virtualenv

# Install zshrc and vim config
cp -f soren.vimrc ~/.vimrc
cp -f soren.zshrc ~/.zshrc
mkdir -p ~/.ssh
cp -f soren.ssh.config ~/.ssh/config
cp -f soren.gitconfig ~/.gitconfig

# Install Real Apps [tm]!
brew cask install caskroom/homebrew-versions/java6
brew cask install google-chrome
brew cask install textmate
brew cask install intellij-idea
brew cask install virtualbox
brew cask install vagrant
brew cask install gitup
brew cask install moom


## TODO: Moom Configuration, Intellij Configuration, Terminal Configuration

#echo "Install solarized terminal template to finish installation:"
#echo "  Use solarized-dark-sovi.terminal as your terminal default colors."

echo "Setup terminal to use Pro template, with Input Mono Extra Light 12pt and block cursor."
echo "Also (IMPORTANT): uncheck 'set locale environment variables on startup' under advanced in the terminal settings."
