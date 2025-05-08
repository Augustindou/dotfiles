if [ "$INSTALLER_OS" = Linux ]; then 
    # Hyprland on apt is outdated
    # install apt:hyprland

    CURRENT_PWD=$PWD

    git clone -b 24.04 --depth 1 https://github.com/JaKooLit/Ubuntu-Hyprland.git ~/.config/Ubuntu-Hyprland-24.04

    cd ~/Ubuntu-Hyprland-24.04
    chmod +x install.sh
    ./install.sh

    cd $CURRENT_PWD

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprland.conf
    
    configure
fi
