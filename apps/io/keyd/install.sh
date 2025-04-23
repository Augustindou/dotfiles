if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:keyd

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/keyboard.conf
    INSTALLER_CONFIG_DESTINATION=/etc/keyd/default.conf
   
    configure

    sudo cp $INSTALLER_DIRECTORY/keyd.service /run/systemd/system/keyd.service
    sudo systemctl enable keyd --now
fi
