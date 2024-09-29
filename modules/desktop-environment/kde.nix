{lib, config, pkgs, ...}: 
let 
    cfg = config.kde;
in {
    options.kde = {
        enable = lib.mkEnableOption "Enable KDE desktop environment";
    };

    config = lib.mkIf cfg.enable {
        services.displayManager.sddm.enable = true;
        services.displayManager.defaultSession = "plasmax11";
        services.desktopManager.plasma6.enable = true;
    };
}