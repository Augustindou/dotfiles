{ lib, config, pkgs, ... }: {

    options.terminal.tmux.enable = lib.mkEnableOption "Enable tmux";
 
    config = lib.mkIf config.terminal.tmux.enable {
        home.file.".config/tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/terminal/tmux/tmux.conf";

        home.packages = with pkgs; [
            tmux
        ];
    };
}
