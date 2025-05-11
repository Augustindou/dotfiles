if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:hyprland

    # install hyprland dotfiles
    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprland.conf
    
    configure

    # add hyprland desktop entry
    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.desktop
    INSTALLER_CONFIG_DESTINATION=/usr/share/wayland-sessions/hyprland.desktop
    
    configure
fi
