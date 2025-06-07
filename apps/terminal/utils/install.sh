install nix:zoxide brew:zoxide;
install nix:eza brew:eza;
install nix:bat brew:bat;
install nix:fzf brew:fzf;
install nix:rip2 brew:rip2;
install nix:ripgrep brew:ripgrep;
install nix:gcc brew:gcc;

if [ "$INSTALLER_OS" = Linux ]; then 
    install nix:wl-clipboard-rs
fi

