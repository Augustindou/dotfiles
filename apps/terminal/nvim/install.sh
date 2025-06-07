install nix:neovim brew:neovim
install nix:gnumake brew:make

INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/config
INSTALLER_CONFIG_DESTINATION=$HOME/.config/nvim

configure
