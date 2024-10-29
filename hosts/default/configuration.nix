{ config, pkgs, inputs, ... }:

{

    # ---------------------------------------------------------------------------
    # imports & base config
    # ---------------------------------------------------------------------------
    imports = [
        ../../general
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
        description = "Augustindou @ NixOS";
    };

    # destop environment
    hyprland.enable = true;

    # programs
    git.enable = true;
    keyboard.enable = true;
    vscode.enable = true;
    nvim.enable = true;

    # terminal
    terminal.lazygit.enable = true;
    terminal.trash.enable = true;

    # ---------------------------------------------------------------------------
    # programs (not configured in modules)
    # ---------------------------------------------------------------------------

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        firefox
        _1password
        _1password-gui
        spotify
        ticktick
        slack
        teams-for-linux
    ];
}
