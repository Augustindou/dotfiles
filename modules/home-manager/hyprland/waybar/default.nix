{ lib, config, pkgs, ... }: {

    options.waybar.enable = lib.mkEnableOption "Enable waybar";
 
    config = lib.mkIf config.waybar.enable {
        programs.waybar = {
            enable = true;
            settings.mainBar = lib.importJSON ./config.json;
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
}
