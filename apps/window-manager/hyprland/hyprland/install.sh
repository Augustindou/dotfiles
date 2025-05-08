if [ "$INSTALLER_OS" = Linux ]; then 
    # Hyprland on apt is outdated
    # install apt:hyprland

    CURRENT_PWD=$PWD

    UBUNTU_HYPRLAND_FOLDER=$HOME/Ubuntu-Hyprland-24.04

    git clone -b 24.04 --depth 1 https://github.com/JaKooLit/Ubuntu-Hyprland.git $UBUNTU_HYPRLAND_FOLDER

    cd $UBUNTU_HYPRLAND_FOLDER
    chmod +x install.sh
    ./install.sh

    cd $CURRENT_PWD

    rm -rf $UBUNTU_HYPRLAND_FOLDER

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprland.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprland.conf
    
    configure
fi
