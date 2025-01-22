{ user, pkgs, ... }:

let 
    user = {
        username = "augustindou";
        name = "Augustin d'Oultremont";
        email = "augustin.doultremontao@gmail.com";
        description = "Augustindou-Arch-VM";
    };
in 
{
    home = {
        username = user.username;
        homeDirectory = "/home/${user.username}";
    };

    imports = [
        ../../modules/home-manager
    ];

    user = user;

    hyprland.enable = true;
    git.enable = true;
    nvim.enable = true;
    terminal.enable = true;
    vscode.enable = true;
    copyq.enable = true;

    home.packages = with pkgs; [
        firefox
        _1password-cli
        _1password-gui
        spotify
        ticktick
        slack
        teams-for-linux
        signal-desktop
        zip
        dotnet-sdk
        dotnet-ef
    ];
}
