if [ "$INSTALLER_OS" = Linux ]; then 
    install apt:sway
    install apt:alacritty
    install nix:kdePackages.dolphin
    install nix:swappy
    install nix:grim
    install nix:slurp
    install nix:pamixer
    install nix:playerctl
    install nix:brightnessctl
    install nix:swayidle

    # install dotfiles
    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/sway/config

    configure
    
    # add desktop entry
    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/sway.desktop
    INSTALLER_CONFIG_DESTINATION=/usr/share/xsessions/sway.desktop

    configure copy
fi
