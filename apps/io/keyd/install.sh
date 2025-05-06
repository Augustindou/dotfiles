if [ "$INSTALLER_OS" = Linux ]; then 
    sudo add-apt-repository ppa:keyd-team/ppa
    sudo apt update

    # Ubuntu 25.04 and earlier
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/

    # Ubuntu 25.10 and later
    # sudo apt install lazygit

    success "Installed keyd";

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/keyboard.conf
    INSTALLER_CONFIG_DESTINATION=/etc/keyd/default.conf
    
    configure

    sudo systemctl enable keyd --now
fi
