if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:hyprland

    # install hyprland dotfiles
    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprland.conf
    
    configure

    # add hyprland desktop entry
    sudo cp "$INSTALLER_DIRECTORY/hyprland.desktop" "/usr/share/xsessions/hyprland.desktop"
fi
