if [ "$INSTALLER_OS" = Linux ]; then 
    sudo add-apt-repository ppa:keyd-team/ppa
    sudo apt update

    success "Installed keyd";

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/keyboard.conf
    INSTALLER_CONFIG_DESTINATION=/etc/keyd/default.conf
    
    configure

    sudo systemctl enable keyd --now
fi
