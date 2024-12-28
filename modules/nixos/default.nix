{ ... }: {
    imports = [
        ./desktop-environment/kde.nix
        ./desktop-environment/hyprland.nix
        ./auto-login.nix
        ./locale.nix
        ./network.nix
        ./sound.nix
        ./zsh.nix
        ./keyboard

        ../user-options.nix
    ];

    config = {
        # Default stuff
        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowunfreepredicate = (_: true);

        system.stateVersion = "24.11";

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        # Bootloader
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        # Enable the X11 windowing system.
        services.xserver.enable = true;

        # Enable CUPS to print documents.
        services.printing.enable = true;
    };
}
