case "$INSTALLER_OS" in
    Linux)
        INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/bashrc
        INSTALLER_CONFIG_DESTINATION=$HOME/.bashrc
        ;;

    Mac)
        INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/zshrc
        INSTALLER_CONFIG_DESTINATION=$HOME/.zshrc
        ;;

    *)
        error "Unknown OS"; 
        exit 1;
        ;;
esac


configure
