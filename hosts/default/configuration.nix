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

  # ---------------------------------------------------------------------------
  # desktop environment / window manager
  # ---------------------------------------------------------------------------

  # gnome
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  # kde
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "plasmax11";
  services.desktopManager.plasma6.enable = true;


  # ---------------------------------------------------------------------------
  # users
  # ---------------------------------------------------------------------------

  home-manager = {
    users.augustindou.programs.firefox = {
      enable = true;
    };
  };

  git.enable = true;
  keyboard.enable = true;
  vscode.enable = true;

  # ---------------------------------------------------------------------------
  # programs
  # ---------------------------------------------------------------------------

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


  # ---------------------------------------------------------------------------
  # nix versions & OS config
  # ---------------------------------------------------------------------------

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; 
}