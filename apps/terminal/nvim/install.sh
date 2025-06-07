install nix:neovim brew:neovim

install nix:gnumake brew:make
install nix:nodejs_24 brew:node
install nix:python313 brew:python

INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
INSTALLER_CONFIG_DESTINATION=$HOME/.config/nvim

configure
