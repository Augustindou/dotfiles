if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:sway-notification-center

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/swaync
    
    configure
fi
