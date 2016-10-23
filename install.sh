#!/bin/bash

# Inspiration:
# - http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html
# - https://github.com/sorenvind/dev-env

# Set up OSX settings
./OSXsettings.sh

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

# Install common sanity
brew tap homebrew/dupes
brew update
brew upgrade
brew install wget curl tree pstree the_silver_searcher gnu-sed
brew install go node python ruby make git

# Install python packages
pip install requests virtualenv

# Install dot files
cp -f .* ~
cp skovhus.zsh-theme ~/.oh-my-zsh/themes

# Install Apps
brew cask install google-chrome
brew cask install atom
brew cask install sublime-text
brew cask install gitup
brew cask install moom
brew cask install dropbox
brew cask install flux
brew cask install jumpcut
brew cask install licecap
brew cask install omnigraffle
brew cask install spotify
brew cask install docker

# Atom packages
apm install `cat atom-packages.list`
cp .atom/config.cson ~/.atom/

# Sublime
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
cp Sublime/User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

## TODO: Moom Configuration, Terminal Configuration
## TODO: quicksilver config

echo "Manual steps:"
echo "- Setup terminal to import solazried-dark theme, with Menlo Regular 10pt and block cursor."
echo "- ensure ~/.gitconfig is correct"
echo "- Set up short cuts http://apple.stackexchange.com/questions/167967/creating-system-wide-keyboard-shortcut-to-launch-applications"
echo "- Open Sublime and install Package Control"
