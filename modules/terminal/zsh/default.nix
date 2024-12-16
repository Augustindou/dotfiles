{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.terminal.zsh;
in
{
  options.terminal.zsh = {
    enable = lib.mkEnableOption "Enable zsh";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      home.file.".zshrc" = {
        source = ./.zshrc;
      };
    };

    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
      zsh
    ];
  };
}
