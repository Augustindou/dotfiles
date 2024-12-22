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
      ./zsh
      ./tmux
      ./starship
      ./lazygit.nix
      ./kitty.nix
    ];

  config = lib.mkIf cfg.enable {
    terminal.lazygit.enable = true;
    terminal.starship.enable = true;
    terminal.kitty.enable = true;
    terminal.zsh.enable = true;
    terminal.tmux.enable = true;

    environment.systemPackages = with pkgs; [
      trashy # trash instead of rm
      ripgrep # rg
      fd # find
      fzf # fuzzy find
      bat # alternative to cat
      zoxide # alternative to cd
      eza # alternative to ls
    ];
  };
}
