if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:wlogout

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/waylogout
    
    configure
fi
