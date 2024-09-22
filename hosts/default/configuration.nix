{ config, pkgs, inputs, ... }:

{

  # ---------------------------------------------------------------------------
  # imports & base config
  # ---------------------------------------------------------------------------
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable bluetooth & wifi
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_BE.UTF-8";
    LC_IDENTIFICATION = "fr_BE.UTF-8";
    LC_MEASUREMENT = "fr_BE.UTF-8";
    LC_MONETARY = "fr_BE.UTF-8";
    LC_NAME = "fr_BE.UTF-8";
    LC_NUMERIC = "fr_BE.UTF-8";
    LC_PAPER = "fr_BE.UTF-8";
    LC_TELEPHONE = "fr_BE.UTF-8";
    LC_TIME = "fr_BE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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
  # keyboard & mouse
  # ---------------------------------------------------------------------------

  # Keyboard repeat delay & interval
  services.xserver.autoRepeatDelay = 250;
  services.xserver.autoRepeatInterval = 30;

  services.xserver.xkb = {
    # TESTS
    # extraLayouts.augustindou = {
    #   description  = "custom mac-like keyboard";
    #   languages    = [ "eng" ];
    #   keycodesFile = pkgs.writeText "augustindou-keycodes" ''
    #     partial xkb_keycodes "augustindou" {
    #       <AT_KEY> = 94;
    #     };
    #   '';
    #   symbolsFile  = pkgs.writeText "augustindou-symbols" ''
    #     partial xkb_symbols "augustindou" {
    #       key <AT_KEY> {[ at, numbersign ]};
    #     };
    #   '';
    # };

    # layout = "augustindou";
    # variant = "augustindou"; 

    layout = "be";
    variant = "iso-alternate";

  };

  # Configure console keymap
  # console.keyMap = "be-latin1";
  console.useXkbConfig = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # ---------------------------------------------------------------------------
  # users
  # ---------------------------------------------------------------------------

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.augustindou = {
    isNormalUser = true;
    description = "Augustindou";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "augustindou" = import ./home.nix;
    };
  };

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
    vscode
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
