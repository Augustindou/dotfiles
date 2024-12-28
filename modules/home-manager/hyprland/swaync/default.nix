{ lib, config, ... }:
let
  cfg = config.swaync;
in
{
    options.swaync.enable = lib.mkEnableOption "Enable sway notification center";
 
    config = lib.mkIf cfg.enable {
        services.swaync = {
            enable = true;
            settings = lib.importJSON ./config.json;
            style = builtins.readFile ./style.css;
        };
    };
}
