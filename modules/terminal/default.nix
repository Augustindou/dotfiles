{lib, config, pkgs, ...}: 
let 
    userCfg = config.user;
    cfg = config.terminal;
in {
    options.terminal = {
        trash.enable = lib.mkEnableOption "Enable Hyprland desktop environment";
    };

    imports =
    [
        ./lazygit.nix
    ];

    config = lib.mkIf cfg.trash.enable {
        environment.systemPackages = with pkgs; [
            trashy
            ripgrep
            fd
            fzf
            bat
        ];
    };
}