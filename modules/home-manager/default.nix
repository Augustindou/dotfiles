{ ... }: {

    imports = [
        ./hyprland
        ./nvim
        ./terminal
        ./vscode
        ./git.nix
        ./styling.nix

        ../user-options.nix
    ];

    config = {
        home.stateVersion = "24.11";

        programs.home-manager.enable = true;

        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowunfreepredicate = (_: true);
    };
}
