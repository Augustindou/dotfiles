if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:hyprlock

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprlock.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprlock.conf
    
    configure
fi
