INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/lazygit.yml

install nix:lazygit brew:lazygit

case "$INSTALLER_OS" in
    Linux)
        INSTALLER_CONFIG_DESTINATION=$HOME/.config/lazygit/config.yml
        ;;

    Mac)
        INSTALLER_CONFIG_DESTINATION="$HOME/Library/Application Support/lazygit/config.yml"
        ;;

    *)
        error "Unknown OS"; 
        exit 1;
        ;;
esac

configure
