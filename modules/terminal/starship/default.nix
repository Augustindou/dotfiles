{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.terminal.starship;
in
{
  options.terminal.starship = {
    enable = lib.mkEnableOption "Enable starship";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      programs.starship = {
        enable = true;
        settings = builtins.fromTOML (builtins.readFile ./starship.toml);
      };
    };

    environment.systemPackages = with pkgs; [
      starship
    ];
  };
}
