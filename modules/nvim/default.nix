{ lib, config, pkgs, ... }:
let
  cfg = config.nvim;
  userCfg = config.user;
in
{
  options.nvim = {
    enable = lib.mkEnableOption "Enable neovim";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username} = {
      home.file.".config/nvim" = {
        source = ./lua-config;
        recursive = true;
      };
    };

    programs.nix-ld.enable = true;
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    environment.systemPackages = with pkgs; [
      neovim

      # To compile & build packages
      gnumake
      gcc
      nodejs_22
      python3
      cargo
      unzip

      # Formatters
      stylua
      black
      rustfmt
      prettierd
      nixpkgs-fmt
    ];
  };
}
