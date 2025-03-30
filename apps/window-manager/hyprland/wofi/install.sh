if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:wofi

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/wofi
    
    configure
fi
