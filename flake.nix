{
    description = "NixOS config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
       
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
       
        rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
        catppuccin.url = "github:catppuccin/nix";
    };

    outputs = { self, nixpkgs, homeManager, ... }@inputs: {
        homeConfigurations.archvm = homeManager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
                system = "x86_64-linux";
                config = {
                    allowUnfree = true;
                };
            };
            modules = [
                ./hosts/archvm/home.nix
            ];
        };

        nixosConfigurations = {
            default = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/default/configuration.nix
                    inputs.catppuccin.nixosModules.catppuccin
                    inputs.home-manager.nixosModules.default
                ];
            };
        };
    };
}
