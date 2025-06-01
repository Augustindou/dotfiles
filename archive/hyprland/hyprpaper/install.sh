if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:hyprpaper

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprpaper.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprpaper.conf
    
    configure
fi
