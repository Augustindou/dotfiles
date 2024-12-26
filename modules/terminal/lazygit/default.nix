{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.terminal.lazygit;
in
{
  options.terminal.lazygit = {
    enable = lib.mkEnableOption "Enable lazygit";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      programs.lazygit.enable = true;

      home.file.".config/lazygit/config.yml" = {
        source = ./lazygit.yml;
      };
    };

    environment.systemPackages = with pkgs; [
      lazygit
      diff-so-fancy
    ];
  };
}
