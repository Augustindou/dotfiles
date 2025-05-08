INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/lazygit.yml

case "$INSTALLER_OS" in
    Linux)
        # Ubuntu 25.04 and earlier
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit -D -t /usr/local/bin/

        rm lazygit.tar.gz
        rm lazygit

        # Ubuntu 25.10 and later
        # sudo apt install lazygit

        INSTALLER_CONFIG_DESTINATION=$HOME/.config/lazygit/config.yml
        ;;

    Mac)
        install brew:lazygit

        INSTALLER_CONFIG_DESTINATION="$HOME/Library/Application Support/lazygit/config.yml"
        ;;

    *)
        echo "Unknown OS"; 
        exit 1;
        ;;
esac

configure
