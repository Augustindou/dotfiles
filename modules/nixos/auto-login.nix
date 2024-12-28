{ lib, config, ... }: {
    options.autologin = {
        enable = lib.mkEnableOption "Enable autologin";
    };
 
    config = lib.mkIf config.autologin.enable {
        services.displayManager.autoLogin = {
            enable = true;
            user = config.user.username;
        };
    };
}
