#!/bin/bash

configure_python() {
    echo "Setting up pyenv"
    pyenv init -
    
    echo "Installing python 3.7.3 globally."
    pyenv install 3.7.3
    pyenv global 3.7.3

    echo "Installing poetry"
    curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
}

install_base() {
    echo "Installing: unix sanity"
    SANITY="vim wget curl tree pstree make git openssl telnet"
    brew install $SANITY

    echo "Installing: python"
    PYTHON="python pyenv xz zlib pyenv-virtualenv"
    brew install $PYTHON
    configure_python
    
    echo "Installing: other languages"
    LANGUAGES="go node ruby java"
    brew install $LANGUAGES
    
    echo "Installing: kubernetes"
    KUBERNETES="kubernetes-cli kubectx kustomize"
    brew install $KUBERNETES

    echo "Installing: dev-helpers"
    DEVHELPERS="httpie yamllint jq parquet-tools"
    brew install $DEVHELPERS

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
    CORPORATE="microsoft-office jetbrains-toolbox keybase microsoft-azure-storage-explorer"
    brew cask install $CORPORATE
}
