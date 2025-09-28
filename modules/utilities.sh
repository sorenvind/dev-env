#!/bin/bash

_install() {
    UTILITY=$1
    UTILITY_FOLDER=utilities
    TARGET=/usr/local/bin
    echo "Installing custom utility: $UTILITY"

    sudo cp -f "$UTILITY_FOLDER/$UTILITY" "$TARGET/$UTILITY"
    chmod +x "$TARGET/$UTILITY"
}

install_utilities() {
    _install "git-subdir-status.sh"
}
