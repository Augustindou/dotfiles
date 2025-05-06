case "$INSTALLER_OS" in
    Linux)
        curl -sS https://starship.rs/install.sh | sh
        success "Installed starship"
        ;;

    Mac)
        install brew:starship
        ;;

    *)
        echo "Unknown OS"; 
        exit 1;
        ;;
esac

INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/starship.toml
INSTALLER_CONFIG_DESTINATION=$HOME/.config/starship.toml

configure
