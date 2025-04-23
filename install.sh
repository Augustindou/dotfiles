#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Allow using custom functions
source ./install-functions.sh

# Set OS env variable for conditions later on
case "$(uname -s)" in
    Linux*)
        INSTALLER_OS=Linux;
        ;;
    Darwin*)
        INSTALLER_OS=Mac;
        ;;
    *)
        echo "OS not recognized"; 
        exit 1;
        ;;
esac

# Install necessary programs to run the scripts
install apt:git brew:git;

if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:curl

    # install nix if it's not installed
    if ! command -v nix-env 2>&1 >/dev/null; then
        sh <(curl -L https://nixos.org/nix/install) --daemon
    fi
fi

install nix:fd brew:fd;

# Check existance of this repo and clone if it doesn't exist
DOTFILES_PATH="$HOME/.config/dotfiles" 
if [ ! -d $DOTFILES_PATH ]; then
    git clone -q https://github.com/Augustindou/dotfiles.git $DOTFILES_PATH;
fi
cd $DOTFILES_PATH;

# Install all programs
for installer in $(fd install.sh apps); do 
    INSTALLER_DIRECTORY=$PWD/$(dirname $installer);
    info "Running installer located at $INSTALLER_DIRECTORY";
    source $installer; 
done
