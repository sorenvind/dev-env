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

# Install common sanity
brew tap homebrew/dupes
brew update
brew upgrade
brew install vim wget curl tree go node python ruby make git

# Newer OpenSSH
brew install openssh --with-brewed-openssl --with-keychain-support
launchctl stop org.openbsd.ssh-agent
launchctl unload -w /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist
sed -i .bak 's|/usr/bin/ssh-agent|/usr/local/bin/ssh-agent|' /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist
launchctl load -w -S Aqua /System/Library/LaunchAgents/org.openbsd.ssh-agent.plist
launchctl start org.openbsd.ssh-agent
/usr/local/bin/ssh-keygen -t ed25519

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
echo "Also (IMPORTANT): uncheck 'set locale environment variables on startup' under advanced in the terminal settings."
