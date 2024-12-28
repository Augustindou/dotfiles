{ lib, config, pkgs, ... }: {

    options.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper";
 
    config = lib.mkIf config.hyprpaper.enable {
        services.hyprpaper = {
            enable = true;
            settings = {
                ipc = "off";
                splash = false;
                preload = [
                    "/home/${config.user.username}/Pictures/wallpaper.jpg"
                ];
            
                wallpaper = [
                    ",/home/${config.user.username}/Pictures/wallpaper.jpg"
                ];
            };
        };

        home.packages = with pkgs; [
            hyprpaper
        ];
    };
}
