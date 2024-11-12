{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.wlogout;
in
{
  options.wlogout = {
    enable = lib.mkEnableOption "Enable wlogout";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      home.file.".config/wlogout/icons" = {
        source = ./icons;
      };

      programs.wlogout = {
        enable = true;
        layout = lib.importJSON ./config.json;
        style = builtins.readFile ./style.css;
      };
    };

    environment.systemPackages = with pkgs; [
      wlogout
    ];
  };
}
