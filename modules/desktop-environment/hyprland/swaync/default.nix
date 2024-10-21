{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.swaync;
in {
    options.swaync = {
        enable = lib.mkEnableOption "Enable sway notification center";
    };

    config = lib.mkIf cfg.enable {
        home-manager.users.${userCfg.username} = {
            services.swaync = {
                enable = true;
                settings = lib.importJSON ./config.json; 
                style = builtins.readFile ./style.css;
            };
        };

        environment.systemPackages = with pkgs; [
            swaynotificationcenter # notifications
        ];
    };
}