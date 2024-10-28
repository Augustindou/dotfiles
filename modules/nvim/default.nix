{lib, config, pkgs, ...}: 
let 
    cfg = config.nvim;
    userCfg = config.user;
in {
    options.nvim = {
        enable = lib.mkEnableOption "Enable neovim";
    };

    config = lib.mkIf cfg.enable {
        home-manager.users.${userCfg.username} = {
            home.file.".config/nvim" = {
                source = ./lua-config;
            };
        };

        environment.systemPackages = with pkgs; [
            neovim
            gnumake
            gcc
        ];
    };
}