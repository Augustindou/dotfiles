{ lib, config, ... }:
let
  cfg = config.wlogout;
in
{
    options.wlogout = {
        enable = lib.mkEnableOption "Enable wlogout";
    };
 
    config = lib.mkIf cfg.enable {
        home.file.".config/wlogout/icons".source = config.lib.file.mkOutOfStoreSymlink 
            "${config.home.homeDirectory}/.config/nixos-config/modules/home-manager/hyprland/wlogout/icons";
 
        programs.wlogout = {
            enable = true;
            layout = lib.importJSON ./config.json;
            style = builtins.readFile ./style.css;
        };
 
    };
}
