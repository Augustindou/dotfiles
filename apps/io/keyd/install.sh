if [ "$INSTALLER_OS" = Linux ]; then 
    install pacman:keyd

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/keyboard.conf
    INSTALLER_CONFIG_DESTINATION=/etc/keyd/default.conf

    configure

    sudo systemctl enable keyd --now
fi
