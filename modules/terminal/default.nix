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

    home-manager.users.${userCfg.username} = {
      home.file.".zshrc" = {
        source = ./.zshrc;
      };
    };

    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;

    environment.systemPackages = with pkgs; [
      zsh

      trashy # trash instead of rm
      ripgrep # rg
      fd # find
      fzf # fuzzy find
      bat # alternative to cat
      zoxide # alternative to cd
      eza # alternative to ls
      starship # custom prompt
    ];
  };
}
