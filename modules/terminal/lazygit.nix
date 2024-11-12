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
      programs.lazygit.settings = {
        gui = {
          statusPanelView = "allBranchesLog";
          scrollHeight = 5;
          mainBranches = [
            "master"
            "main"
            "production"
            "develop"
          ];
          branchColors = {
            feature = "default";
            bugfix = "default";
            hotfix = "default";
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      lazygit
    ];
  };
}
