{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.hyprland;
in {
    options.hyprland = {
        enable = lib.mkEnableOption "Enable Hyprland desktop environment";
    };

    config = lib.mkIf cfg.enable {
        programs.hyprland.enable = true;

        home-manager.users.${userCfg.username}.wayland.windowManager.hyprland = {
            enable = true;
            extraConfig = builtins.readFile ./hyprland.conf;
        };

        environment.systemPackages = with pkgs; [
            kitty
            wofi
            kdePackages.dolphin
        ];
    };
}