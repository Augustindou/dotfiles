if [ "$INSTALLER_OS" = Linux ]; then 
    if command -v apt 2>&1 >/dev/null; then 
        sudo add-apt-repository ppa:keyd-team/ppa
    fi

    install pacman:keyd apt:keyd

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/keyboard.conf
    INSTALLER_CONFIG_DESTINATION=/etc/keyd/default.conf

    configure

    sudo systemctl enable keyd --now
fi
