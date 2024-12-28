{ lib, config, pkgs, ... }: {

    options.terminal.lazygit.enable = lib.mkEnableOption "Enable lazygit";

    config = lib.mkIf config.terminal.lazygit.enable {
        programs.lazygit.enable = true;
 
        home.file.".config/lazygit/config.yml".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/terminal/lazygit/lazygit.yml";

        home.packages = with pkgs; [
            diff-so-fancy
        ];
    };
}
