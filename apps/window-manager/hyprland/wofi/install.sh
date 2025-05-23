if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:wofi

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/wofi
    
    configure
fi
