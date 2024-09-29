{lib, config, pkgs, ...}: 
let 
    cfg = config.keyboard;
in {
    options.keyboard = {
        enable = lib.mkEnableOption "Enable keyboard modifications";
    };

    # configured
    config = lib.mkIf cfg.enable {
        # Keyboard repeat delay & interval
        services.xserver.autoRepeatDelay = 250;
        services.xserver.autoRepeatInterval = 30;

        # Keyd remaps
        services.keyd = {
            enable = true;
            keyboards.default = {
                ids = ["*"];
                extraConfig = builtins.readFile ./mac-keyboard.conf;
            };
        };
        
        environment.systemPackages = with pkgs; [
            keyd
        ];
    };
}