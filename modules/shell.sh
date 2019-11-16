#!/bin/bash

install_shell() {
    echo "Install latest zsh and oh-my-zsh"
    OMZ=~/.oh-my-zsh
    if test ! -d $OMZ
    then
    brew install zsh zsh-completions zsh-syntax-highlighting
    # zsh to be default shell..
    chsh -s /bin/zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
}
