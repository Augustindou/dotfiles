{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.hyprpaper;
in
{
  options.hyprpaper = {
    enable = lib.mkEnableOption "Enable sway notification center";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      services.hyprpaper = {
        enable = true;
        settings = {
          ipc = "off";
          splash = false;
          preload = [
            "/home/${userCfg.username}/Pictures/wallpaper.jpg"
          ];

          wallpaper = [
            ",/home/${userCfg.username}/Pictures/wallpaper.jpg"
          ];
        };
      };
    };

    environment.systemPackages = with pkgs; [
      hyprpaper
    ];
  };
}
