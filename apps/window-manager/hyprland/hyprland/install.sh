if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:hyprland

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprland.conf
    
    configure
fi
