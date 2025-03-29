#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Set OS env variable for conditions later on
case "$(uname -s)" in
    Linux*)
        INSTALLER_OS=Linux;
        BASE_INSTALLER=apt;
        ;;
    Darwin*)
        INSTALLER_OS=Mac;
        BASE_INSTALLER=brew;
        ;;
    *)
        echo "OS not recognized"; 
        exit 1;
        ;;
esac

# Install necessary programs to run the scripts
if ! git -v >/dev/null; then $BASE_INSTALLER install git; fi 
if ! fd -V >/dev/null; then $BASE_INSTALLER install fd; fi 

# Check existance of this repo and clone if it doesn't exist
DOTFILES_PATH="$HOME/.config/dotfiles" 
if [ ! -d $DOTFILES_PATH ]; then
    git clone -q https://github.com/Augustindou/dotfiles.git $DOTFILES_PATH;
fi
cd $DOTFILES_PATH;

source ./install-functions.sh

# Install all programs
for installer in $(fd install.sh apps); do 
    INSTALLER_DIRECTORY=$PWD/$(dirname $installer);
    source $installer; 
done
