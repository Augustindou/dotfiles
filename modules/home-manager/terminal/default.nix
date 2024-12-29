{ lib, config, pkgs, ... }:
let
  cfg = config.terminal;
in
{
  options.terminal.enable = lib.mkEnableOption "Enable terminal customizations";

  imports =
    [
      ./zsh
      ./tmux
      ./starship
      ./lazygit
      ./kitty.nix
    ];

  config = lib.mkIf cfg.enable {
    terminal.lazygit.enable = true;
    terminal.starship.enable = true;
    terminal.kitty.enable = true;
    terminal.zsh.enable = true;
    terminal.tmux.enable = true;

    home.packages = with pkgs; [
      rip2 # rip instead of rm
      ripgrep # rg
      fd # find
      fzf # fuzzy find
      bat # alternative to cat
      zoxide # alternative to cd
      eza # alternative to ls
    ];
  };
}
