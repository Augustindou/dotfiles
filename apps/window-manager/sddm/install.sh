if [ "$INSTALLER_OS" = Linux ]; then 
    install pacman:sddm

    # add hyprland desktop entry
    # sudo cp "$INSTALLER_DIRECTORY/hyprland.desktop" "/usr/share/xsessions/hyprland.desktop"
fi
