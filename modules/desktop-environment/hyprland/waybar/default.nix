{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.waybar;
in {
    options.waybar = {
        enable = lib.mkEnableOption "Enable waybar";
    };

    config = lib.mkIf cfg.enable {
        home-manager.users.${userCfg.username} = {
            programs.waybar = {
                enable = true;
                settings.mainBar = lib.importJSON ./config.jsonc;
                style = builtins.readFile ./style.css;
            };

            # fonts for icons
            fonts.fontconfig.enable = true;
            home.packages = with pkgs; [
                fira-code
                fira-code-symbols
                font-awesome
                liberation_ttf
                mplus-outline-fonts.githubRelease
                nerdfonts
                noto-fonts
                noto-fonts-emoji
                proggyfonts
            ];
        };

        environment.systemPackages = with pkgs; [
            waybar
        ];
    };
}