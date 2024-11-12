{ lib, config, pkgs, inputs, ... }:
let
  cfg = config.user;
in
{
  options.user = {
    username = lib.mkOption {
      type = lib.types.str;
      description = "Username (used in path & other places)";
    };

    name = lib.mkOption {
      type = lib.types.str;
      description = "Name";
      default = cfg.username;
    };

    email = lib.mkOption {
      type = lib.types.str;
      description = "Email (used for git)";
    };

    description = lib.mkOption {
      type = lib.types.str;
      description = "Description";
      default = "";
    };
  };

  config = {
    users.users.${cfg.username} = {
      initialPassword = "12345";
      isNormalUser = true;
      description = cfg.description;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [ ];
    };

    home-manager = {
      extraSpecialArgs = { inherit inputs; };

      users.${cfg.username} = {
        home = {
          username = cfg.username;
          homeDirectory = "/home/${cfg.username}";
          stateVersion = "24.05";
          file = { };
          sessionVariables = { };
          packages = with pkgs; [ ];
        };

        nixpkgs.config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };

        programs.home-manager.enable = true;
      };

    };
  };
}
