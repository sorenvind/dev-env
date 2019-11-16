#!/bin/bash

_setup_config() {
    SOURCE=$1
    DEST=$2
    SOURCE_FOLDER=configs
    echo "Setting up dotconfig: $DEST"

    cp -f "$SOURCE_FOLDER/$SOURCE" "$DEST"
}

install_configs() {
    echo "Setting up configuration"
    mkdir -p ~/.ssh

    _setup_config soren.vimrc ~/.vimrc
    _setup_config soren.zshrc ~/.zshrc
    _setup_config soren.ssh.config ~/.ssh/config
    _setup_config soren.gitconfig ~/.gitconfig
    _setup_config soren.gitignore_global ~/.gitignore_global
}
