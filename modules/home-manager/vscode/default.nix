{ lib, config, pkgs, ... }: {

    options.vscode.enable = lib.mkEnableOption "Enable vscode";

    config = lib.mkIf config.vscode.enable {
        programs.vscode = {
            enable = true;
           
            extensions = with pkgs.vscode-extensions; [
                vscodevim.vim
            ];
        };

        home.file.".config/Code/User/settings.json".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/vscode/settings.json";
        home.file.".config/Code/User/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/vscode/keybindings.json";
    };
}
