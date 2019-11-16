#!/bin/bash

configure_python() {
    echo "Setting up pyenv"
    pyenv init -
    
    echo "Installing python 3.7.3 globally."
    pyenv install 3.7.3
    pyenv global 3.7.3
}

install_base() {
    echo "Installing: unix sanity"
    SANITY="vim wget curl tree pstree make git openssl telnet httpie yamllint"
    brew install $SANITY

    echo "Installing: languages"
    LANGUAGES="go node ruby"
    brew install $LANGUAGES

    echo "Installing: python"
    PYTHON="python pyenv xz zlib pyenv-virtualenv"
    brew install $PYTHON
    configure_python

    echo "Installing: kubernetes"
    KUBERNETES="kubernetes-cli kubectx kustomize"
    brew install $KUBERNETES

    echo "Installing: azure"
    AZURE="git-crypt mssql-tools azure-cli"
    brew install $AZURE
}

install_apps() {
    echo "Installing: base apps"
    BASE_APPS="google-chrome moom slack visual-studio-code"
    brew cask install $BASE_APPS

    echo "Installing: docker edge"
    brew tap homebrew/cask-versions
    brew cask install docker-edge

    echo "Installing: corporate"
    CORPORATE="microsoft-office jetbrains-toolbox keybase"
    brew cask install $CORPORATE
}
