{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.wofi;
in
{
  options.wofi = {
    enable = lib.mkEnableOption "Enable wofi";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      programs.wofi = {
        enable = true;
        settings = {
          mode = "drun";
          prompt = "Search...";
          insensitive = true;
          filter_rate = 25;
          allow_images = true;
          image_size = 32;
          dynamic_lines = true;
          no_actions = true;
        };
        style = builtins.readFile ./style.css;
      };
    };

    environment.systemPackages = with pkgs; [
      wofi
    ];
  };
}
