{ lib, config, pkgs, ... }:
let
  userCfg = config.user;
  cfg = config.terminal;
in
{
  options.terminal = {
    enable = lib.mkEnableOption "Enable terminal customizations";
  };

  imports =
    [
      ./lazygit.nix
      ./kitty.nix
    ];

  config = lib.mkIf cfg.enable {
    terminal.lazygit.enable = true;
    terminal.kitty.enable = true;

    environment.systemPackages = with pkgs; [
      trashy
      ripgrep
      fd
      fzf
      bat
    ];
  };
}
