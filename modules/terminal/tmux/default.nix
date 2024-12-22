{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.terminal.tmux;
in
{
  options.terminal.tmux = {
    enable = lib.mkEnableOption "Enable tmux";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
    
      programs.tmux = {
        enable = true;
        catppuccin.enable = false;
        extraConfig = builtins.readFile ./tmux.conf;
      };
    };

    environment.systemPackages = with pkgs; [
      tmux
            # tmuxPlugins.dracula
    ];
  };
}
