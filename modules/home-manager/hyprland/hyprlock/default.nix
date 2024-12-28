{ lib, config, ... }:
let
  cfg = config.hyprlock;
in
{
    options.hyprlock.enable = lib.mkEnableOption "Enable hyprlock";
 
    config = lib.mkIf cfg.enable {
        programs.hyprlock = {
            enable = true;
            extraConfig = builtins.readFile ./hyprlock.conf;
        };
    };
}
