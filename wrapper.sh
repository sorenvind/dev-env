#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
SETUP_MODULES_PATH="$DIR/modules"

import_module() {
    module_name=$1
    echo "Importing module $module_name"    
    source "$SETUP_MODULES_PATH/$module_name"
}

echo "Installation starting."
for mod in `ls $SETUP_MODULES_PATH`; do
    import_module $mod
done

config_macos_settings
install_brew
install_shell
install_fonts
install_utilities
install_base
install_apps
install_configs

echo "Setup terminal and xcode to use Pro template, with Input Mono Extra Light 12pt, antialias non-bold text and block cursor."
echo "Also (IMPORTANT): uncheck 'set locale environment variables on startup' under advanced in the terminal settings."
