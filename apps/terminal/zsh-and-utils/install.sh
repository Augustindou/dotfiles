
if [ "$INSTALLER_OS" = Linux ]; then 
    # Only install using apt, because it is the default shell on MacOS
    install apt:zsh;
fi

install apt:zoxide brew:zoxide;
install apt:eza brew:eza;
install apt:bat brew:bat;
install apt:fzf brew:fzf;
install brew:rip2 cargo:rip2;
install apt:ripgrep brew:ripgrep;

INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/zshrc
INSTALLER_CONFIG_DESTINATION=$HOME/.zshrc

configure

if [ "$INSTALLER_OS" = Linux ]; then 
    chsh -s $(which zsh)
fi

