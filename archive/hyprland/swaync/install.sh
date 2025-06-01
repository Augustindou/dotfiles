if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:swaynotificationcenter

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/swaync
    
    configure
fi
