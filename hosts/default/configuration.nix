{ config, pkgs, inputs, ... }:

{

  # ---------------------------------------------------------------------------
  # imports & base config
  # ---------------------------------------------------------------------------
  imports =
    [
      ../../modules
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # User
  user = {
    username = "augustindou";
    name = "Augustin d'Oultremont";
    email = "augustin.doultremontao@gmail.com";
    description = "Personal computer";
  };

  git.enable = true;
  keyboard.enable = true;
  vscode.enable = true;
  kde.enable = true;

  # ---------------------------------------------------------------------------
  # programs (not configured in modules)
  # ---------------------------------------------------------------------------

  home-manager = {
    users.augustindou.programs.firefox = {
      enable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    firefox
    neovim
    _1password
    _1password-gui
    spotify
    ticktick
  ];
}