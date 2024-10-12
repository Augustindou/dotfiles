{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.hyprlock;
in {
    options.hyprlock = {
        enable = lib.mkEnableOption "Enable hyprlock";
    };

    config = lib.mkIf cfg.enable {
        home-manager.users.${userCfg.username} = {
            programs.hyprlock = {
                enable = true;
                extraConfig = lib.strings.concatStrings [
                    ("$backgroundPicture = Pictures/wallpaper.jpg")
                    (builtins.readFile ./hyprlock.conf)
                ];
            };
        };

        environment.systemPackages = with pkgs; [
            hyprlock # lock screen
        ];
    };
}