{ lib, config, ... }: {

    options.terminal.zsh.enable = lib.mkEnableOption "Enable zsh";
 
    config = lib.mkIf config.terminal.zsh.enable {
        home.file.".zshrc".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/terminal/zsh/.zshrc";
    };
}
