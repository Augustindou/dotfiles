# Only install using apt, because it is the default shell on MacOS
install apt:zsh;

INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/zshrc
INSTALLER_CONFIG_DESTINATION=$HOME/.zshrc

configure

if [ "$INSTALLER_OS" = Linux ]; then 
    chsh -s $(which zsh)
fi

