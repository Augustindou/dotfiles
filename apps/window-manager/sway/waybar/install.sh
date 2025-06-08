if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:waybar

    install nix:bluetuith

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/waybar
    
    configure
fi
