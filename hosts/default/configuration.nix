{ inputs, ... }:
let 
    user = {
        username = "augustindou";
        name = "Augustin d'Oultremont";
        email = "augustin.doultremontao@gmail.com";
        description = "Augustindou-NixOS-Desktop";
    };
in 
{
    imports = [
        ./hardware-configuration.nix
        ../../modules/nixos
    ];

    keyboard.macKeyboard.enable = true;
    hyprland.enable = true;
    autologin.enable = true;
    terminal.zsh.enable = true;

    # ---------------------------------------------------------------------------
    # User
    # ---------------------------------------------------------------------------

    user = user;

    users.users."${user.username}" = {
        isNormalUser = true;
        initialPassword = "12345";
        description = user.description;
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # ---------------------------------------------------------------------------
    # Home-Manager
    # ---------------------------------------------------------------------------

    home-manager = {
        extraSpecialArgs = { 
            inherit inputs; 
            inherit user;
        };

        users = {
            "${user.username}" = import ./home.nix;
        };
    };
}
