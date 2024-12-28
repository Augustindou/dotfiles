{ lib, config, ... }: {
    options.hyprland = {
        enable = lib.mkEnableOption "Enable hyprland";
    };

    config = lib.mkIf config.hyprland.enable {
        programs.hyprland.enable = true;
    };
}
