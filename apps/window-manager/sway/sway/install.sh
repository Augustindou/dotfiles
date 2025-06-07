if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:sway

    # install dotfiles
    # INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.conf
    # INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprland.conf
    
    # add desktop entry
    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/sway.desktop
    INSTALLER_CONFIG_DESTINATION=/usr/share/xsessions/sway.desktop

    configure copy
fi
