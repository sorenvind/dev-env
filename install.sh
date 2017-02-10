#!/bin/bash

# Inspiration: http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html

# Set up OSX settings
./OSXsettings.sh

# Install homebrew and cask
if test ! $(which brew)
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew tap caskroom/cask
fi

# Install fonts
unzip -q Input-Font.zip -d inputfont
cp inputfont/Input_Fonts/*/*/*.ttf /Library/Fonts/
rm -fr inputfont
brew tap caskroom/fonts
brew cask install font-hack
brew cask install font-source-code-pro

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
brew install vim wget curl tree go node pstree python ruby make git zsh-syntax-highlighting
brew install cmake asio python

# Install python packages
pip install pygments requests virtualenv

# Build tools++
brew install cmake asio libconfig
pip install cheetah

# Install dot configs
cp -f soren.vimrc ~/.vimrc
cp -f soren.zshrc ~/.zshrc
mkdir -p ~/.ssh
cp -f soren.ssh.config ~/.ssh/config
cp -f soren.gitconfig ~/.gitconfig
cp -f soren.gitignore_global ~/.gitignore_global

# Install Real Apps [tm]!
#brew cask install caskroom/homebrew-versions/java6
brew cask install google-chrome
brew cask install textmate
brew cask install intellij-idea
brew cask install virtualbox
brew cask install vagrant
brew cask install gitup
brew cask install moom
brew cask install slack
brew cask install atom
brew cask install intel-power-gadget


## TODO: Moom Configuration, Intellij Configuration, Terminal Configuration
## TODO: SSH KEYS -> https://help.github.com/articles/generating-an-ssh-key/


#echo "Install solarized terminal template to finish installation:"
#echo "  Use solarized-dark-sovi.terminal as your terminal default colors."

echo "Setup terminal to use Pro template, with Input Mono Extra Light 12pt and block cursor."
echo "Also (IMPORTANT): uncheck 'set locale environment variables on startup' under advanced in the terminal settings."
