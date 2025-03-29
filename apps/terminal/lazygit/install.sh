install apt:lazygit brew:lazygit

INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/lazygit.yml

case "$INSTALLER_OS" in
    Linux)
        INSTALLER_CONFIG_DESTINATION=$HOME/.config/lazygit/config.yml
        ;;
    Mac)
        INSTALLER_CONFIG_DESTINATION="$HOME/Library/Application Support/lazygit/config.yml"
        ;;
    *)
        echo "Unknown OS"; 
        exit 1;
        ;;
esac

configure
