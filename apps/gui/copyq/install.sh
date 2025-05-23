if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:copyq;

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/copyq.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/copyq/copyq.conf
    
    configure
fi

