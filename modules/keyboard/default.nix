{lib, config, pkgs, ...}: 
let 
    cfg = config.keyboard;
in {
    options.keyboard = {
        enable = lib.mkEnableOption "Enable keyboard modifications";
    };

    config = lib.mkIf cfg.enable {
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